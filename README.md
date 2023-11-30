# My dotfiles

Arch Linux setup centered around practicality and minimalism.

* i3-gaps + i3lock + i3bar + i3status
* zsh (no oh-my-zsh), powerlevel10k prompt
* alacritty
* nvim
* bemenu
* dunst
* picom (no weird forks, just normal picom)
* gruvbox is life

![](screenshot.png)

Use at own risk, or actually don't use this at all, dotfiles are a very personal thing, write your own 😛.
The config can serve as inspiration, however, many hours of my life have been spent editing these files.

# Installation

## Clone

The repo must be cloned in the user's home as `~/dotfiles`

```sh
git clone https://github.com/pabloariasal/dotfiles.git ~
```

## Install `paru`
[paru](https://github.com/Morganamilo/paru) is used as AUR helper.

```sh
./install install_paru
```

# Symlinking

The configuration is divided into separate programs that can be symlinked independently using [GNU stow](https://www.gnu.org/software/stow/).

```sh
install_config <name_of_config>
```
etc.
