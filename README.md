# macDotfiles

dotfiles for mac

# managed

- .config
  - nvim
  - fish
  - wezterm
- .vim
- .vimrc

# Install

- [Homebrew](https://brew.sh/index_ja)

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- [NeoVim](https://neovim.io/)

```
$ brew update
$ brew install neovim
```

If I am able to confirm with the `nvim -v`command, the installation is complete.

![nvim_-v](/doc/images/nvim-v.png)

- [wezterm](https://wezfurlong.org/wezterm/install/macos.html)

```
$ brew install --cask wez/wezterm/wezterm
```

- [fish](https://github.com/oh-my-fish/oh-my-fish)

First, check the current shell.

```
$ echo $PATH
```

Change the default shell is fish.

```
$ brew install fish
$ sudo vi /etc/shells # /usr/local/bin/fish add
$ chsh -s /usr/local/bin/fish # default shell is fish
```

Install a package manager called fisher.

```
$ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

![fisher](/doc/images/fisher.png)

next step is `oh-my-fish` install.

```
$ fisher install oh-my-fish/theme-bobthefish
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh
$ rm -rf ./fonts
```

The fish settings are in macDotfiles.

# Using createLink.sh

This sh creates a link to the .config itself. `fish` or `nvim` alone can be created with the following command.

## How to create links for individual directories and individual files

- nvim directory only, how to make links

```
$ ln -s ~/macDotfiles/.config/nvim ~/.config/
```

- fish directory only, how to make links

```
$ ln -s ~/macDotfiles/.config/fish ~/.config/
```

- .vimrc only, how to make links

```
$ ln -s ~/macDotfiles/.vimrc ~/.vimrc
```

or

```
$ ln -s ~/macDotfiles/.vimrc ~/
```
