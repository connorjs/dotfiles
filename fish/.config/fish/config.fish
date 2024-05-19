if status is-interactive
	tabs -3

	abbr -a n nvim
	abbr -a d pushd
	abbr -a ssh ssh -2
	abbr -a icat kitty +kitten icat

	set -gx VISUAL nvim
	set -gx EDITOR $VISUAL
end

if test -e "$HOME/local.fish"
	source "$HOME/local.fish"
end
