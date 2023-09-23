# Binaries
tap "linuxbrew/xorg" if OS.linux?
brew "fish"
brew "git"
brew "jq"
brew "bat"
brew "tree"
brew "nvim"
brew "python@3.8"
brew "wget"
brew "docker"
brew "gradle"
brew "imagemagick"
brew "coreutils"
brew "cowsay"
brew "lolcat"
brew "stow"
brew "mas" if OS.mac?

# https://github.com/corretto/corretto-8/issues/42
tap "homebrew/cask-versions"
cask "corretto8"
cask "corretto"

# Fonts
tap "homebrew/cask-fonts" if OS.mac?
cask "font-jetbrains-mono-nerd-font", args: { fontdir: "/Library/Fonts" }

# macOS apps
cask_args appdir: "/Applications"
cask "1password"
cask "alfred"
cask "amazon-chime"
cask "amazon-photos"
cask "authy"
cask "docker"
cask "firefox"
cask "flux" # Settings: Halogen, Tungsten, Candle
cask "google-chrome"
cask "jetbrains-toolbox"
#cask "microsoft-excel"
cask "microsoft-edge"
#cask "microsoft-powerpoint"
#cask "microsoft-outlook"
#cask "microsoft-word"
cask "opera"
cask "quip"
cask "rocket" # Settings: :: as trigger
cask "setapp"
cask "sketch"
cask "sketchpacks"
cask "spotify"
cask "visual-studio-code"
cask "xpra"

# macOS App Store
mas "Magnet", id: 441258766
mas "Endel", id: 1484348796
