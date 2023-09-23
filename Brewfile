# Brew file - Keep each section alphabetical
# https://github.com/Homebrew/homebrew-bundle#readme

# Binaries
# Keep in sync with README table!
brew "bat"
brew "coreutils"
brew "cowsay"
brew "fish"
brew "git"
brew "imagemagick"
brew "jq"
brew "lolcat"
brew "lsd"
brew "nvim"
brew "stow"

# Fonts
tap "homebrew/cask-fonts" if OS.mac?
cask "font-jetbrains-mono-nerd-font", args: { fontdir: "/Library/Fonts" }

# macOS apps
cask_args appdir: "/Applications", require_sha: true
cask "1password"
cask "alfred"
cask "authy"
cask "firefox"
cask "flux" # Settings: Halogen, Tungsten, Candle
cask "google-chrome"
cask "jetbrains-toolbox"
cask "microsoft-edge"
cask "rocket" # Settings: :: as trigger
cask "spotify"
cask "visual-studio-code"
cask "xpra"

# macOS App Store
brew "mas" if OS.mac?
mas "1Password for Safari", id: 1569813296
mas "Clocker", id: 1056643111
mas "Dark Reader for Safari", id: 1438243180
mas "Endel", id: 1484348796
mas "Live Home 3D Pro: Design House", id: 1066145115
mas "Magnet", id: 441258766
mas "Speedtest by Ookla", id: 1153157709
