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

DOTFILES_DIR=$HOME/dotfiles
if [ ! -d $DOTFILES_DIR ]; then
  echo "dotfiles not installed in $HOME"
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

# Allow failures w/ `|| true` (some things may already be installed)
brew bundle exec -- \
    brew bundle install --file "$DOTFILES_DIR/Brewfile" --no-lock || true 

myecho '1️⃣' 'Packages installed 📦\n'

# 2. OS-specific
myecho '2️⃣' 'Running OS-specific setup...'

# Execute all `*.sh` scripts in OS-specific (as returned by `uname`) directory
find "${DOTFILES_DIR}/$(uname)" -type f -name '*.sh' -exec {} \;

myecho '2️⃣' 'OS-specific setup ran 🏃‍♂️\n'

#################
# 3. Symlinking #
#################

myecho '3️⃣' 'Symlinking dotfiles...'

# Just use stow 🤩
stow -vt $HOME fish node vim

myecho '3️⃣' 'Dotfiles symlinked 🔗\n'

############
# 4. Shell #
############

myecho '4️⃣' 'Configuring shell...'

# Change fish to default shell
if [[ ! $(echo $SHELL) == $(which fish) ]]; then
  # Add fish to `/etc/shells` if not present
  cat /etc/shells | grep /usr/local/bin/fish > /dev/null || \
      sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'
  chsh -s $(which fish)
fi

# Configure fisher
fish -c 'if not functions -q fisher; curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish; end'
fish -c fisher

# Other one-time fish setup
curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish

myecho '4️⃣' 'Shell configured 🐟\n'

##############
# N. Cleanup #
##############

echo '    ✅ Complete!'

exit 0
