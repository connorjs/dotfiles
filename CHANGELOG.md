# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [2024-05](https://github.com/connorjs/dotfiles/compare/2023-09...HEAD)

### Added

- `lsd` color configuration
- Proper Neovim configuration with plugins and lua-based config
- Keyboard configuration via Karabiner
- Copy `bin` files (`on-dark-mode-change`)

### Changed

- Added `.editorconfig` for editing these files
- Revamped `lsd` config including fish aliases
- Began splitting installation scripts to allow partial runs
- Updated Brewfile to reflect latest needs
- General, minor config tweaks (see commits for details)

### Removed

- Removed traditional Vim in favor of only using Neovim

## [2023-09](https://github.com/connorjs/dotfiles/compare/pre-changelog...2023-09)

### Added

- Created CHANGELOG
- lsd config
- Oh My Posh prompt
- fnm (fast node manager)
- git global files
- fish completions, functions, and variables to git

### Changed

- Modified and added git aliases (abbreviations in fish)
- Updated Homebrew-managed formulae, casks, and macOS apps
- Synced fish config
- Update bash shebang to `#!/usr/bin/env bash`

### Removed

- AWS CLI (not actively using AWS as of 2023-09)
- iterm2 (replaced by kitty)
- nvm (replaced by fnm)
- fisher (only used for nvm)
- Custom fish prompt (replaced by Oh My Posh)

## [Earlier](https://github.com/connorjs/dotfiles/compare/d161fac...pre-changelog)

No changelog was recorded prior to 2023-09.
