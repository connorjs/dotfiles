# Connor’s dotfiles

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

Welcome to my dotfiles repo! In this repo you will find my public configurations
including an install script.

If you have tips/tricks/etc, I’d love to hear them! Cheers

## TL;DR

- 📜 Single install script
- 📦 [Homebrew] for package manager
- 🐟 [fish shell][fish]
- 🔌 vim-plug (and [neovim])

## Install

1. Clone this repo into `$HOME/w/connorjs` (_see next section for why_)
2. Run the install script: `./install.sh`
3. Edit `.gitconfig` (or use `git config --global`)
4. Restart to see all changes

```shell
mkdir -p $HOME/w/connorjs && \
cd $HOME/w/connorjs && \
git clone https://github.com/connorjs/dotfiles.git && \
cd dotfiles && \
./install.sh && \
cd $HOME && \
vim .gitconfig
```

## File system

### XDG config

`$HOME/.config`: I prefer to use the XDG config pattern where possible.

The install script uses `stow` to link this repositories packages. For example,
`.vimrc` ends up in `$HOME` and the `init.vim` script ends up in
`$HOME/.config/nvim` as expected. Also see [“Using GNU Stow to manage your
dotfiles”][stow-blog-post].

_The package names in this repository exist as preferred logical naming. Only
this install script uses them; they do not appear in the target file system._

### Workspaces

`$HOME/w`: Workspaces for code repositories. I name it `w` for brevity. If
needed, create `w` on the appropriate drive and symlink to it from `$HOME`.

Namespacing: Regardless of tooling, I see namespacing for code repositories.
GitHub has the user or organization, AWS has the account, and Azure DevOps has
the project.

I match this namespacing with the first-level directory structure under `w`.
For example, this repository will exist at `$HOME/w/connorjs/dotfiles`.

_Note: I have considered having separate workspaces or another directory per
tool. For example, `~/gh` or `~/w/gh` for GitHub. However, I have yet to hit
conflicts that warrant this additional namespace scheme._

## Utilities

[Homebrew] installs the following utilities (listed alphabetically).

|     Name      | Description/reason                     |
|:-------------:|:---------------------------------------|
|     [bat]     | Cat clone with wings                   |
|   [cowsay]    | _For fun_                              |
|     curl      | _Ensure latest version_                |
|    [fish]     | Fish shell                             |
|     [fnm]     | Fast node manager                      |
|      git      | _Ensure latest version_                |
|  [git-delta]  | Syntax-highlighting pager (git diff)   |
| [imagemagick] | Converting and editing images          |
|     [jq]      | Command-line JSON processor            |
|     [lsd]     | LSDeluxe                               |
|    lolcat     | _For fun_                              |
|    [nvim]     | Hyper-extensible Vim-based text editor |
| [oh-my-posh]  | Prompt theme engine for any shell      |
|    [stow]     | Symlink farm manager                   |

See the [Brewfile](./Brewfile) for the complete list including macOS apps.

<!-- @formatter:off -->
[bat]: https://github.com/sharkdp/bat#readme
[cowsay]: https://en.wikipedia.org/wiki/Cowsay
[fish]: https://fishshell.com
[fnm]: https://github.com/Schniz/fnm#readme
[git-delta]: https://dandavison.github.io/delta/
[homebrew]: https://brew.sh/
[imagemagick]: https://github.com/ImageMagick/ImageMagick#readme
[jq]: https://jqlang.github.io/jq/
[lsd]: https://github.com/lsd-rs/lsd#readme
[nvim]: https://neovim.io/
[oh-my-posh]: https://ohmyposh.dev
[stow]: https://www.gnu.org/software/stow/
[stow-blog-post]: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
