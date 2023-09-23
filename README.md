# Connor's dotfiles

> [!IMPORTANT]
>
> I started working on new updates on Sep 23, 2023. Treat the README and install
> scripts as out-of-date until I remove this message. I have two goals for these
> updates in addition to syncing my latest settings and preferences.
>
> 1. Windows compatibility
> 2. Full system configuration (beyond the terminal)
>
> [Browse the last stable version](https://github.com/connorjs/dotfiles/tree/pre-changelog).

Welcome to my dotfiles repo! In this repo you will find my public configurations including an install script.

Feel free to use any of this for inspiration, but note that I do not plan on ensuring compatibility. (_These are my personal dotfiles and I may change them on a whim._)

> **General mindset**
>
> Minimize config by embracing defaults

If you have tips/tricks/etc, I'd love to hear them! Cheers

## TL;DR

- 📜️Single install script
- 📦Brew for package manager
- 🐟fish shell
- 🔌 vim-plug (and neovim)

## Install

1. Clone this repo into your `$HOME` directory (the script expects `$HOME/dotfiles` to be this repo)
2. Run the install script: `./install.sh`
3. Restart to see all changes

## File system

- `$HOME/.config`: XDG config pattern. I prefer to use this where possible.

  The install script uses `stow` to link this repositories packages. For
  example, `.vimrc` ends up in `$HOME` and the `init.vim` script ends up in
  `$HOME/.config/nvim` as expected.

  _The package names in this repository exist as preferred logical naming. Only
  this install script uses them; they do not appear in the target file system._ 

- `$HOME/w`: Workspaces for code repositories. I name it `w` for brevity. If
  needed, create `w` on the appropriate drive and symlink to it from `$HOME`.

  Namespacing: Regardless of tooling, I see namespacing for code repositories.
  GitHub has the user or organization, AWS has the account, and Azure DevOps has
  the project.

  I match this namespacing with the first-level directory structure under `w`.
  For example, this repository will exist at `$HOME/w/connorjs/dotfiles`.

  _Note: I have considered having separate workspaces or another directory per
  tool. For example, `~/gh` or `~/w/gh` for GitHub. However, I have yet to hit
  conflicts that warrant this additional namespace scheme._   

## Things to do

- [X] Single install script
- [ ] Document (educational, for memory)
- [ ] App settings (e.g. VS Code extensions)
- [X] Source "local" file (allow private config) → `~/local.fish`

## Links

Here's a link dump in no order from my initial configuration.

- <http://redsymbol.net/articles/unofficial-bash-strict-mode/>
- <https://github.com/webpro/awesome-dotfiles>
- <https://github.com/jorgebucaran/awesome-fish>
- <https://github.com/mathiasbynens/dotfiles>
- <https://reckoning.dev/fish-shell/>
- <https://brew.sh/>
- <https://formulae.brew.sh/>
- <https://github.com/paulirish/dotfiles>
- <https://github.com/Homebrew/homebrew-bundle>
- <https://fishshell.com/>
- <https://mywiki.wooledge.org/BashPitfalls>
- <http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html?round=two>
- <https://www.sean.sh/log/when-an-alias-should-actually-be-an-abbr/>
- <https://github.com/junegunn/vim-plug>
- <https://neovim.io/>
