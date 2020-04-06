#!/bin/bash -
set -euo pipefail
IFS=$'\t\n'

# Source: http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/

# Specify directory and use those settings
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/dotfiles/Darwin"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
