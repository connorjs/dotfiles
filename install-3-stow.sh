#!/usr/bin/env bash
set -euo pipefail
IFS=$'\t\n'

DOTFILES_DIR=$(dirname "$0")

# Just use stow 🤩
pushd "$DOTFILES_DIR"
stow -vt "$HOME" \
	fish \
	karabiner \
	kitty \
	lsd \
	node \
	oh-my-posh \
	vim
popd

# Prefer copy for git (credentials), do not overwrite
cp -n "$DOTFILES_DIR"/git/.* "$HOME"

mkdir -p "$HOME"/bin
cp -n "$DOTFILES_DIR"/bin/* "$HOME"/bin
