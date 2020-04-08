# Remove greeting
set fish_greeting

# Path
set -g fish_user_paths /usr/local/sbin $HOME/bin $fish_user_paths

# iTerm integration
source ~/.iterm2_shell_integration.fish
function iterm2_print_user_vars
  # Left: \(user.logo) | Current directory | git state
  # Right: Node: \(user.node) | Clock
  iterm2_set_user_var node (node -v)
  switch (uname)
    case Darwin
      iterm2_set_user_var logo \uf302 # 
    case Linux
      iterm2_set_user_var logo \uf31a # 
    case '*'
      iterm2_set_user_var logo \uf29c # 
  end
end

# CLI
abbr -a d 'pushd'
abbr -a .. 'pushd ../'
abbr -a ... 'pushd ../../'
abbr -a .... 'pushd ../../../'
abbr -a ..... 'pushd ../../../../'
# Stop at four (ex: package in one workspace to somewhere else)

# Vim
abbr -a n 'nvim'
abbr -a v 'nvim'
abbr -a vim 'nvim' # Accept muscle memory
set -gx VISUAL nvim
set -gx EDITOR $VISUAL

# Other
abbr -a ssh 'ssh -2'

# git (last b/c so long)
abbr -a g 'git'
abbr -a ga 'git add'
abbr -a gb 'git branch'
abbr -a gbD 'git branch -D'
abbr -a gbd 'git branch -d'
function gbda 
  git branch --no-color --merged | command grep -vE '^(\+|\*|\s*(master|mainline)\s*$)' | command xargs -n 1 git branch -d
end
abbr -a gc 'git commit -v'
abbr -a gca 'git commit -v -a'
abbr -a gcaa 'git commit -v -a --amend'
abbr -a gcam 'git commit -a -m'
abbr -a gcan! 'git commit -a --amend --no-edit'
abbr -a gcm 'git checkout master'
abbr -a gco 'git checkout'
abbr -a gcob 'git checkout -b'
abbr -a gcp 'git cherry-pick'
abbr -a gcpa 'git cherry-pick --abort'
abbr -a gcpc 'git cherry-pick --continue'
abbr -a gcps 'git cherry-pick --skip'
abbr -a gd 'git diff'
abbr -a gd 'git diff'
abbr -a gd 'git diff'
abbr -a gf 'git fetch'
abbr -a gl 'git log --decorate --graph'
abbr -a glo 'git log --decorate --graph --oneline'
abbr -a gls 'git log --decorate --graph --stat'
abbr -a glo 'git log --oneline --decorate --graph'
abbr -a gm 'git merge'
abbr -a gp 'git pull'
abbr -a grb 'git rebase'
abbr -a grba 'git rebase --abort'
abbr -a grbc 'git rebase --continue'
abbr -a grbs 'git rebase --skip'
abbr -a gs 'git status'

if test -e ~/local.fish
  source ~/local.fish
end

