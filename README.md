# My dotfiles

Arch Linux setup centered around practicality and minimalism.

* i3-gaps + i3lock + i3bar + i3status
* zsh (no oh-my-zsh), powerlevel10k prompt
* alacritty
* nvim
* patched dmenu
* dunst
* picom (no weird forks, just normal picom)
* gruvbox is life

![](screenshot.png)

Use at own risk, or actually don't use this at all, dotfiles are a very personal thing, write your own 😛.
The config can serve as inspiration, however, many hours of my life have been spent editing these files compulsively.

# Installation

## Clone

The repo must be cloned in the user's home as `~/dotfiles`

```sh
git clone https://github.com/pabloariasal/dotfiles.git ~
```

## Install `paru`
[paru](https://github.com/Morganamilo/paru) is used as AUR helper.

```sh
./misc/install_packages install_paru
```

## Install Arch Packages
```sh
./misc/install_packages install_packages
```

## Install AUR Packages
```sh
./misc/install_packages install_aur
```

## Grab the `nerd-fonts`
```
./misc/install_fonts clone_nerd_fonts
./misc/install_fonts install_nerd_fonts
```

# Symlinking

The configuration is divided into separate programs that can be symlinked independently using [GNU stow](https://www.gnu.org/software/stow/).

```sh
stow --verbose=2 scripts
stow --verbose=2 greenclip
```
etc.
