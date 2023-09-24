if status is-interactive
	tabs -3

	# CLI
	abbr -a d  pushd
	abbr -a cd pushd

	# Vim
	abbr -a n nvim
	abbr -a v nvim
	set -gx VISUAL nvim
	set -gx EDITOR $VISUAL

	# Other
	abbr -a ssh  ssh -2
	abbr -a icat kitty +kitten icat
end

if test -e "$HOME/local.fish"
  source "$HOME/local.fish"
end
