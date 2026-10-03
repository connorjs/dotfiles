# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [2026-10](https://github.com/connorjs/dotfiles/compare/2025-05...HEAD)

A ground-up reset for macOS only (home and work).

### Changed

- Replace stow and the install scripts with [chezmoi](https://www.chezmoi.io).
  - Templates for work vs. home (git email, commit signing, corporate CA).
  - The Brewfile, `mise install`, and macOS defaults re-run automatically when they change.
  - `.chezmoiremove` cleans up the stow-era symlinks.
- Replace Oh My Posh with [Starship](https://starship.rs), ported from the old theme.
- Replace kitty with [Ghostty](https://ghostty.org), using its built-in light/dark themes.
- Add `./test.sh` to validate the repo without touching `~`.
- Strip Neovim down to a plain editor: options only, no plugins.
- Make mise the only runtime manager (replaces fnm and direnv), including .NET (always the latest release). Drops Ruby.
- Move fish universal variables (PATH, telemetry opt-outs) into a tracked, machine-agnostic `config.fish`.
- Move git ignore and attributes to `~/.config/git/`, and track the full `.gitconfig`.
- Add `fd`, `fzf`, `zoxide`, `uv`, PowerShell 7, tilt, and other daily CLI tools to the Brewfile.
- Set TextEdit's plain-text font to JetBrains Mono NFM 18.

### Removed

- Windows plans, Karabiner, kitty, the dark-mode-change script, VS Code.

## [2025-05](https://github.com/connorjs/dotfiles/compare/2024-11...2025-05)

- Use [mise](https://mise.jdx.dev) to manage tool versions.
  - Removes fnm.
  - Replaces `.node-version` with general `.tool-versions`.
  - Adds language base for my needs.
  - Node 24.
  - Does NOT include .NET ([download .NET](https://dotnet.microsoft.com/en-us/download)).
- Remove `fish_variables` which causes per-machine conflicts.

## [2024-11](https://github.com/connorjs/dotfiles/compare/2024-05...2025-05)

### Changed

- Node 23
- Added JetBrains fish abbreviations (e.g. `ride` expands to `rider *.sln`)
- Oh My Posh config upgrade
- Updated `.editorconfig` to be my “standard” one

## [2024-05](https://github.com/connorjs/dotfiles/compare/2023-09...2024-05)

### Added

- `lsd` color configuration
- Proper Neovim configuration with plugins and lua-based config
- Keyboard configuration via Karabiner
- Copy `bin` files (`on-dark-mode-change`)
- Kitty themes that use Selenized but modify background to match Precious Themes
- Smart quote karabiner configuration (`CAPS` + one of `[];'`)
- Other Karabiner configuration from recent usage

### Changed

- Added `.editorconfig` for editing these files
- Revamped `lsd` config including fish aliases
- Began splitting installation scripts to allow partial runs
- Updated Brewfile to reflect latest needs
- General, minor config tweaks (see commits for details)
- Tweaked command line prompt (timing and status code are now on hrule line to bring them closer to previous command)

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
