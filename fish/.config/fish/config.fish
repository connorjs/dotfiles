# CLI
abbr -a d 'pushd'
abbr -a cd 'pushd'

# Vim
abbr -a v 'nvim'
set -gx VISUAL nvim
set -gx EDITOR $VISUAL

# Other
abbr -a ssh 'ssh -2'

if test -e "$HOME/local.fish"
  source "$HOME/local.fish"
end
