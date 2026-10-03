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

| I want to…                       | Run                                                   |
| -------------------------------- | ----------------------------------------------------- |
| Change a dotfile                 | Edit it under `home/`, then `chezmoi apply` (`cm`)    |
| Preview what apply would change  | `chezmoi diff`                                        |
| Keep a change an app made itself | `chezmoi re-add`                                      |
| Add a brew package               | Add it to `home/dot_Brewfile`, then `chezmoi apply`   |
| Change a runtime version         | Edit `home/dot_config/mise/config.toml`, then `apply` |
| Pull changes from the other Mac  | `chezmoi update`                                      |
| Check the repo before applying   | `./test.sh` (renders into throwaway homes, never `~`) |

The Brewfile, mise config, and macOS defaults re-run automatically when they change.

## Layout

`.chezmoiroot` points chezmoi at `home/`, which mirrors `~`.

| Path                            | What                                                             |
| ------------------------------- | ---------------------------------------------------------------- |
| `home/.chezmoi.toml.tmpl`       | Per-machine data: `work`, `name`, `email`                        |
| `home/.chezmoiscripts/`         | Brew bundle, login shell, `mise install`, macOS defaults         |
| `home/.chezmoiremove`           | Old files to delete (stow-era symlinks, kitty, Karabiner)        |
| `home/dot_Brewfile`             | CLI tools and apps (no language runtimes)                        |
| `home/dot_config/fish/`         | fish config and abbreviations (`config.fish.tmpl` has work bits) |
| `home/dot_config/ghostty/`      | Terminal                                                         |
| `home/dot_config/mise/`         | Global runtime versions                                          |
| `home/dot_config/nvim/`         | Plain Neovim, no plugins                                         |
| `home/dot_config/starship.toml` | Prompt                                                           |
| `home/dot_gitconfig.tmpl`       | git (commit signing only at home)                                |

## Machine differences

- **Templates:** `{{ if .work }}` in any `.tmpl` file. The answers live in `~/.config/chezmoi/chezmoi.toml`. Run `chezmoi init` again to change them.
- **Untracked overrides:** `~/.config/fish/local.fish` for anything one machine needs that should not be committed.
- **Per-project versions:** mise reads the version files a repo already has (`.nvmrc`, `.node-version`, `global.json`, `.python-version`, …). For a personal pin, use `mise.local.toml`. The global git ignore keeps it out of commits.

[chezmoi]: https://www.chezmoi.io
[fish]: https://fishshell.com
[homebrew]: https://brew.sh

## Ideas

Out of scope for the 2026-10 reset. ⭐ = strongly recommended.

- ⭐ **CI:** run `./test.sh` in a GitHub Action on a macOS runner for every PR.
- ⭐ **SSH config:** track `~/.ssh/config` with 1Password's agent (`IdentityAgent`) so keys never touch disk and both Macs match.
- ⭐ **Touch ID for `sudo`:** add `pam_tid.so` to `/etc/pam.d/sudo_local` (it survives macOS updates) from the macOS defaults script.
- ⭐ **Brewfile drift:** periodically run `brew bundle cleanup --file=~/.Brewfile` to list installed-but-untracked packages, then track or uninstall them.
- ⭐ **Claude Code config:** track `~/.claude/settings.json` and `~/.claude/CLAUDE.md` (not the per-project or session data).
- **Secrets via 1Password:** use chezmoi's `onepasswordRead` in templates once something needs a token (e.g. an AzDO PAT for npm/NuGet feeds at work).
- **Neovim, step 2:** [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) for in-editor Markdown rendering, added with the built-in `vim.pack.add`.
- **Neovim, step 3:** native LSP (`vim.lsp.config` / `vim.lsp.enable`, no plugins) once plain editing feels natural.
- **Practice vim motions everywhere:** `fish_vi_key_bindings` in the shell, IdeaVim in JetBrains (track `~/.ideavimrc`).
- **Starship transient prompt:** collapse previous prompts to `❯` to keep scrollback clean (`enable_transience` in fish).
- **delta light/dark:** recent delta detects the terminal background itself; try dropping the `defaults read` workaround in `.gitconfig`.
- **Ghostty quick terminal:** a global hotkey (`keybind = global:…=toggle_quick_terminal`) for a drop-down terminal.
