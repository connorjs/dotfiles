#!/usr/bin/env bash
# Validate the repo without touching ~: render and apply into throwaway homes
# (work and home), then lint/parse everything that comes out.
# Needs: chezmoi, shellcheck, fish, starship, nvim, git (all in the Brewfile).
set -euo pipefail

repo=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

failures=0
pass() { printf '  ✅ %s\n' "$1"; }
fail() { printf '  ❌ %s\n' "$1"; failures=$((failures + 1)); }
check() { # check <description> <command...>
	local description=$1
	shift
	if "$@" > "$tmp/out" 2>&1; then pass "$description"; else fail "$description" && sed 's/^/     /' "$tmp/out"; fi
}

for work in true false; do
	echo "work=$work"
	config="$tmp/chezmoi-$work.toml"
	dest="$tmp/home-$work"
	cz() { chezmoi --no-tty --source "$repo" --config "$config" --persistent-state "$tmp/state-$work.boltdb" "$@"; }

	# Simulate a stow-era machine: dangling symlinks the apply must replace or remove
	mkdir -p "$dest/.config" "$dest/Library/Application Support/com.mitchellh.ghostty"
	ln -s ../nowhere/fish "$dest/.config/fish"
	ln -s nowhere "$dest/.gitignore"
	echo old > "$dest/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

	check "chezmoi init" cz init --promptBool "Work machine=$work" --promptString "Git name=Test User,Git email=test@example.com"
	check "chezmoi apply (files only)" cz apply --force --destination "$dest" --exclude scripts
	check "stow symlink replaced by a directory" test -d "$dest/.config/fish" -a ! -L "$dest/.config/fish"
	check "stale files removed" test ! -e "$dest/.gitignore" -a ! -e "$dest/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

	check "fish config parses" fish --no-execute "$dest/.config/fish/config.fish"
	for f in "$dest"/.config/fish/{conf.d,functions,completions}/*.fish; do
		check "fish parses $(basename "$f")" fish --no-execute "$f"
	done
	check "git config parses" git config --file "$dest/.gitconfig" --list
	check "nvim loads init.lua" nvim --headless -u "$dest/.config/nvim/init.lua" +q
	check "starship renders" env STARSHIP_CONFIG="$dest/.config/starship.toml" STARSHIP_SHELL=fish starship prompt --terminal-width 80

	if [[ $work == true ]]; then
		check "work: corporate CA set" grep -q 'NODE_EXTRA_CA_CERTS' "$dest/.config/fish/config.fish"
		check "work: no commit signing" bash -c "! grep -q gpgsign '$dest/.gitconfig'"
	else
		check "home: no corporate CA" bash -c "! grep -q NODE_EXTRA_CA_CERTS '$dest/.config/fish/config.fish'"
		check "home: commit signing on" grep -q 'gpgsign = true' "$dest/.gitconfig"
	fi

	# Scripts: render templates, then syntax-check and lint (never run them)
	mkdir -p "$tmp/scripts-$work"
	for s in "$repo"/home/.chezmoiscripts/*; do
		out="$tmp/scripts-$work/$(basename "${s%.tmpl}")"
		if [[ $s == *.tmpl ]]; then cz execute-template < "$s" > "$out"; else cp "$s" "$out"; fi
		check "shellcheck $(basename "$out")" shellcheck --severity=warning "$out"
	done
done

echo
if ((failures)); then echo "❌ $failures check(s) failed"; exit 1; fi
echo "✅ All checks passed"
