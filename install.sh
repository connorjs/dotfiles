#!/bin/bash -
set -euo pipefail
IFS=$'\t\n'

# Overview
# 1. Packages
# 2. OS-specific
# 3. Symlinking
# 4. Shell

################
# 0. Pre-steps #
################

DOTFILES_DIR=$HOME/w/connorjs/dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "dotfiles not installed in $HOME/w/connorjs"
  exit 1
fi

myecho() { # Hack for better visibility for me
  printf '    %s /4 %b\n' "$1" "$2"
}

###############
# 1. Packages #
###############

myecho '1️⃣' 'Installing packages with brew...'

# Only download brew if not present
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null
fi

# Opt-out https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
brew analytics off

# Allow failures w/ `|| true` (some things may already be installed)
brew bundle exec -- \
    brew bundle install --file "$DOTFILES_DIR/Brewfile" --no-lock || true 

myecho '1️⃣' 'Packages installed 📦\n'

# 2. OS-specific
myecho '2️⃣' 'Running OS-specific setup...'

# Execute all `*.sh` scripts in OS-specific (as returned by `uname`) directory
if [ -d "${DOTFILES_DIR}/$(uname)" ]; then
  find "${DOTFILES_DIR}/$(uname)" -type f -name '*.sh' -exec {} \;
fi

myecho '2️⃣' 'OS-specific setup ran 🏃‍♂️\n'

#################
# 3. Symlinking #
#################

myecho '3️⃣' 'Symlinking dotfiles...'

# Just use stow 🤩
stow -vt "$HOME" fish node oh-my-posh vim
cp git/* "$HOME" # Prefer copy for git (credentials)

myecho '3️⃣' 'Dotfiles symlinked 🔗\n'

############
# 4. Shell #
############

myecho '4️⃣' 'Configuring shell...'

# Change fish to default shell
if [[ ! "$SHELL" == $(which fish) ]]; then
  # Add fish to `/etc/shells` if not present
  grep "$(which fish)" < /etc/shells > /dev/null || \
      sudo sh -c "echo $(which fish) >> /etc/shells"
  chsh -s "$(which fish)"

  # Finish in fish
  fish -c "fish_add_path $HOME/bin"
  fish -c "fish_add_path /opt/homebrew/opt/curl/bin"
fi

myecho '4️⃣' 'Shell configured 🐟\n'

##############
# N. Cleanup #
##############

echo '    ✅ Complete!'
exit 0
