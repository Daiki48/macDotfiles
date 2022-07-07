# macDotfiles
dotfiles for mac

# managed
- .config
  - nvim
  - fish

# Install
- [Homebrew](https://brew.sh/index_ja)

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- [NeoVim]

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
