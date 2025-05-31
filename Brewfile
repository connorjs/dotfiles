# Brew file - Keep each section alphabetical
# https://github.com/Homebrew/homebrew-bundle#readme

# Binaries
# Keep in sync with README table!
brew "bat"
brew "curl"
brew "danielgtaylor/restish/restish"
brew "fish"
brew "git"
brew "git-delta"
brew "imagemagick"
brew "jq"
brew "lsd"
brew "nvim"
brew "oh-my-posh"
brew "stow"

# Fonts
cask "font-jetbrains-mono-nerd-font", args: { fontdir: "/Library/Fonts" }

# macOS apps
cask_args appdir: "/Applications", require_sha: true
cask "1password"
cask "1password-cli"
cask "alfred"
cask "flux" # Settings: Halogen, Tungsten, Candle
cask "jetbrains-toolbox"
cask "rocket" # Settings: :: as trigger
cask "visual-studio-code"

# macOS App Store
brew "mas" if OS.mac?
mas "1Password for Safari", id: 1569813296
mas "Clocker", id: 1056643111
mas "Dark Reader for Safari", id: 1438243180
mas "Endel", id: 1484348796
mas "Live Home 3D Pro: Design House", id: 1066145115
mas "Magnet", id: 441258766
mas "Speedtest by Ookla", id: 1153157709
