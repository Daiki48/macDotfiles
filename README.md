# macDotfiles
dotfiles for mac

# managed
- nvim

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
