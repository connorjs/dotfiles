<div align="center">

# connorjs dotfiles

macOS at home and at work. One [chezmoi][chezmoi] repo.

[![](./images/openmoji/fish.svg) fish][fish]
· Ghostty · Neovim · Starship · mise ·
[![](./images/openmoji/beer-mug.svg) Homebrew][homebrew]

</div>

## New Mac

1. Sign in to the App Store (for `mas`) and to 1Password (the SSH agent signs commits).
2. Install [Homebrew][homebrew], then `brew install chezmoi`.
3. Clone and apply:

   ```shell
   chezmoi init --apply --source ~/w/connorjs/dotfiles connorjs
   ```

   It asks three questions once (work machine? git name? git email?), then:

   - installs everything in the [Brewfile](home/dot_Brewfile),
   - writes the dotfiles,
   - makes fish the login shell,
   - installs runtimes with `mise install`,
   - applies the [macOS defaults](home/.chezmoiscripts/run_onchange_after_40-macos-defaults.sh).

4. Finish by hand:
   - JetBrains Toolbox: sign in, then turn on **Backup and Sync** (IDE settings live there, not here).
   - Rider: set the .NET CLI to `$DOTNET_ROOT/dotnet` (GUI apps do not see the shell's mise environment).
   - Vite+: run `vp env off` so mise owns Node.
   - Work: put the corporate CA at `~/certs/tql.pem`.
   - Alfred, Rocket, and Flux settings (see the Brewfile comments).

## Day to day

| I want to…                         | Run                                                   |
| ---------------------------------- | ----------------------------------------------------- |
| Change a dotfile                   | Edit it under `home/`, then `chezmoi apply` (`cm`)    |
| Preview what apply would change    | `chezmoi diff`                                        |
| Keep a change an app made itself   | `chezmoi re-add`                                      |
| Add a brew package                 | Add it to `home/dot_Brewfile`, then `chezmoi apply`   |
| Change a runtime version           | Edit `home/dot_config/mise/config.toml`, then `apply` |
| Pull changes from the other Mac    | `chezmoi update`                                      |

The Brewfile, mise config, and macOS defaults re-run automatically when they change.

## Layout

`.chezmoiroot` points chezmoi at `home/`, which mirrors `~`.

| Path                         | What                                                            |
| ---------------------------- | --------------------------------------------------------------- |
| `home/.chezmoi.toml.tmpl`    | Per-machine data: `work`, `name`, `email`                       |
| `home/.chezmoiscripts/`      | Brew bundle, login shell, `mise install`, macOS defaults        |
| `home/.chezmoiremove`        | Old files to delete (stow-era symlinks, kitty, Karabiner)       |
| `home/dot_Brewfile`          | CLI tools and apps (no language runtimes)                       |
| `home/dot_config/fish/`      | fish config and abbreviations (`config.fish.tmpl` has work bits) |
| `home/dot_config/ghostty/`   | Terminal                                                        |
| `home/dot_config/mise/`      | Global runtime versions                                         |
| `home/dot_config/nvim/`      | Plain Neovim, no plugins                                        |
| `home/dot_config/starship.toml` | Prompt                                                       |
| `home/dot_gitconfig.tmpl`    | git (commit signing only at home)                               |

## Machine differences

- **Templates:** `{{ if .work }}` in any `.tmpl` file. The answers live in `~/.config/chezmoi/chezmoi.toml`. Run `chezmoi init` again to change them.
- **Untracked overrides:** `~/.config/fish/local.fish` for anything one machine needs that should not be committed.
- **Per-project versions:** mise reads the version files a repo already has (`.nvmrc`, `.node-version`, `global.json`, `.python-version`, …). For a personal pin, use `mise.local.toml`. The global git ignore keeps it out of commits.

[chezmoi]: https://www.chezmoi.io
[fish]: https://fishshell.com
[homebrew]: https://brew.sh
