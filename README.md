<a id="readme-top"></a>

<div align="center">

# connorjs dotfiles

Mac and Windows. Multiple shells. Same tools. One `install` script.

## Highlights

</div>

<table>
<tr>
<td width="1024px" align="center">

<h3 id="mac">Mac</h3>

```shell
./install.sh
```

[![](./images/openmoji/fish.svg) Fish][fish].
[![](./images/openmoji/cat-face.svg) Kitty][kitty].
[![](./images/openmoji/beer-mug.svg) Homebrew][homebrew].

</td>
<td width="50%" align="center">

<h3 id="windows">Windows</h3>

```shell
./install.bat
```

Shell?
Terminal?
[![](./images/openmoji/chocolate-bar.svg) Chocolatey?][chocolatey].

</td>
</tr>
<tr>
<td colspan="2" align="center">

Nushell?
PowerShell?
[Oh My Posh][oh-my-posh].
[Neovim][nvim].

</td>
</tr>
</table>

<details>
<summary>Table of Contents</summary>

- [Highlights](#highlights)
- [About](#about)
- [Install](#install)
- [Terminal](#terminal)
- [Utilities](#utilities)
- [Aliases](#aliases)
- [File system](#file-system)

</details>

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

## About

Welcome to my dotfiles repo! You will find my public configurations including
a single install script for each OS.

If you have any tips, tricks, or recommendations, I’d love to hear them! Cheers

<div align="right">(<a href="#readme-top">back to top</a>)</div>

## Install

1. Clone this repo
2. Run the install script: `./install.sh` for Mac and `./install.bat` for Windows
3. Edit `.gitconfig` (or use `git config --global`)
4. Restart to see all changes

<details>
<summary>Shell commands</summary>

```shell
mkdir -p $HOME/w/connorjs && \
cd $HOME/w/connorjs && \
git clone https://github.com/connorjs/dotfiles.git && \
cd dotfiles && \
./install.sh && \
cd $HOME && \
vim .gitconfig
```

_See [§ Workspaces](#workspaces) for why I use the `~/w/connorjs` path._

</details>

<div align="right">(<a href="#readme-top">back to top</a>)</div>

## Terminal

I use [Kitty] (a fast, feature-rich, GPU based terminal emulator) with
[Selenized] (Solarized redesigned) color schemes (Light and Black). The
[on-dark-mode-change](./bin/on-dark-mode-change) script syncs the Kitty theme
with the System preference.

I have programmed the F6 media key to toggle between light and dark mode (the
key has a moon on it; its original function is Do not Disturb).

<div align="right">(<a href="#readme-top">back to top</a>)</div>

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
|     [lsd]     | LSDeluxe (includes `--tree`)           |
|    lolcat     | _For fun_                              |
|    [nvim]     | Hyper-extensible Vim-based text editor |
| [oh-my-posh]  | Prompt theme engine for any shell      |
|    [stow]     | Symlink farm manager                   |

See the [Brewfile](./Brewfile) for the complete list including macOS apps.

<div align="right">(<a href="#readme-top">back to top</a>)</div>

## Aliases

Includes a consistent configuration of aliases (abbreviations in fish) across
multiple shells.

- Fish: [fish/conf.d](./fish/.config/fish/conf.d)

### Git

Includes shell aliases inspired by [gitalias.com][git-alias-dot-com],
[Nushell][git-alias-nushell], [Oh My Zsh][git-alias-zsh], and [a Fish shell git
plugin][git-alias-fish]. Mine do not match 1:1 in the same way that these do
not match 1:1 to each other.

To ensure strong consistency across my own shell configurations, I hand-write
all aliases instead of sourcing them. I also do not include aliases I never use
(example: `--signoff` variations for `git commit`).

### LSD

Includes various `ls` aliases: `l`, `la`, `ll`, `lt`, `t`, `t3`, and more.

<div align="right">(<a href="#readme-top">back to top</a>)</div>

## File system

### XDG base directory

`$HOME/.config`: I prefer to follow the [XDG base directory
specification][xdg-basedir-spec] where possible.

_I need to figure out the Windows parallel. Maybe `%APPDATA%`?_

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

<div align="right">(<a href="#readme-top">back to top</a>)</div>

## Acknowledgements

### Attributions

#### OpenMoji

All emojis designed by [OpenMoji](https://openmoji.org/) – the open-source emoji
and icon project. License: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/#).

See [images/openmoji/LICENSE.md](./images/openmoji/LICENSE.md) for details on
modifications and ShareAlike redistribution.

<div align="right">(<a href="#readme-top">back to top</a>)</div>

<!-- @formatter:off -->
[bat]: https://github.com/sharkdp/bat#readme
[chocolatey]: https://community.chocolatey.org
[cowsay]: https://en.wikipedia.org/wiki/Cowsay
[fish]: https://fishshell.com
[fnm]: https://github.com/Schniz/fnm#readme
[git-alias-dot-com]: https://www.gitalias.com
[git-alias-fish]: https://github.com/jhillyerd/plugin-git#readme
[git-alias-nushell]: https://github.com/nushell/nu_scripts/blob/main/aliases/git/git-aliases.nu
[git-alias-zsh]: https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index
[git-delta]: https://dandavison.github.io/delta/
[homebrew]: https://brew.sh/
[imagemagick]: https://github.com/ImageMagick/ImageMagick#readme
[jq]: https://jqlang.github.io/jq/
[kitty]: https://sw.kovidgoyal.net/kitty/
[lsd]: https://github.com/lsd-rs/lsd#readme
[nvim]: https://neovim.io/
[oh-my-posh]: https://ohmyposh.dev
[selenized]: https://github.com/jan-warchol/selenized/tree/master#readme
[stow]: https://www.gnu.org/software/stow/
[stow-blog-post]: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
[xdg-basedir-spec]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
