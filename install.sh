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

# Opt-out https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
brew analytics off

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

# Finish in fish
fish -c '

# Install fisher if not present
if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

# Run fisher (install functions)
fisher

# Function-specific install
nvm # loads node

# Solarized Light (same using UI via `fish_config`)
set -U fish_color_normal normal
set -U fish_color_command 586e75
set -U fish_color_quote 839496
set -U fish_color_redirection 6c71c4
set -U fish_color_end 268bd2
set -U fish_color_error dc322f
set -U fish_color_param 657b83
set -U fish_color_comment 93a1a1
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=white
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 93a1a1
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion green
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_prefix cyan --underline
set -U fish_pager_color_progress brwhite --background=cyan 
'

myecho '4️⃣' 'Shell configured 🐟\n'

##############
# N. Cleanup #
##############

echo '    ✅ Complete!'
exit 0

