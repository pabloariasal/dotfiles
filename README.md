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

## Prerequisites

- Fresh Arch install (no xorg installed yet)
- user is created with zsh as login shell
- sudo is installed and the user is entered in the sudoers file
- nvim is installed
- Internet connection

## Download Installation Scripts

```sh
sudo pacman -S wget tar
cd ~
wget https://api.github.com/repos/pabloariasal/dotfiles/tarball/master -O dotfiles.tar.gz
tar -xzvf dotfiles.tar.gz
```
there is now a directory `pabloariasal-dotfiles-xxx` containing installation scripts and setup files.


## Install Xorg

```sh
cd pabloariasal-dotfiles-xxx
./install install_xorg
```

### Setup xinit and zprofile

In order to launch i3-wm [xinit](https://wiki.archlinux.org/title/Xinit) needs to be setup. `startx` is called from `zprofile`.

```sh
sudo pacman -S xorg-xinit
cd pabloariasal-dotfiles-XXX
cp configs/xorg/.xinitrc ~/.xinitrc
cp configs/zsh/.zprofile ~/.zprofile
cp configs/zsh/.env ~/.env
```

## Install i3-wm

```sh
cd pabloariasal-dotfiles-xxx
./install install_i3_wm
```

## Install paru

```sh
cd pabloariasal-dotfiles-xxx
./install install_paru
```

## Install google-chrome

```sh
paru -S google-chrome
```

## Install alacritty

It's important to install a terminal before booting into i3-wm

```sh
sudo pacman -S alacritty
```

## Boot into i3-wm

Now we should be able to boot into i3-wm:

- Create a default config
- `mod+enter` opens a alacritty

## Generate ssh keys

```sh
sudo pacman -S xclip
./install create_github_personal_ssh_key
```

### Add ssh public key to github account

1. open a terminal
2. start google chrome
3. enter public key in the clipboard in github account

### Start ssh Agent and add ssh key

```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_personal
```

## Clone dotfiles

```sh
sudo pacman -S git
./install clone_repo
```

The dotfiles repo is now cloned to the home directory


## Shell Configuration

```sh
rm ~/.xinitrc ~/.zprofile ~/.env
cd dotfiles
sudo pacman -S stow
install_config zsh
install_config env
```

## xorg configuraton

```sh
rm ~/.xinitrc
cd dotfiles
install_config xorg
cd dotfiles
./install install_keyboard_conf
```

## i3-wm configuration

```sh
rm -r ~/.config/i3/config
cd dotfiles
install_config i3
install_config i3status
```

## Fonts

```sh
cd dotfiles
./install install_nerd_fonts
```

## git Configuration

```sh
cd dotfiles
install_config git
```

## Install Scripts

```sh
cd dotfiles
./install install_scripts
```

## Install CLI Goodies

```sh
./install install_command_line_goodies
install_config vifm
```

## Terminal Configuration

```sh
intall_config alacritty
```

## NeoVim Configuration

```sh
sudo pacman -S ctags
intall_config nvim
```

## Compositor

```sh
sudo pacman -S picom
install_config picom
```

## `ssh-agent` service

```sh
cd dotfiles
install_config systemd
./install enable_agent_service
```

## Tlp

```sh
sudo pacman -S tlp
sudo systemctl enable tlp.service
```

## Wallpaper

```sh
sudo pacman -S nitrogen
cd dotfiles
./install install_wallpapers
```

Open nitrogen and add `~/wallpapers` as wallpaper directory (recursively), select a wallpaper.

## Pdfs, Image Viewer and Window Swallowing

```sh
sudo pacman -S zathura zathura-pdf-mupdf eog
cd dotfiles
./install install_devour
```

`iv` and `za` in command line can be use to open pdfs and images!

## Clipboard Manager

```sh
./install install_greenclip
install_config greenclip
```

## Screenshots

```sh
sudo pacman -S flameshot
```

## Notifications

```sh
sudo pacman -S dunst libnotify gnome-themes-extra
install_config dunst
```

## Brightness and Audio Control

```sh
sudo pacman -S brightnessctl playerctl
```

## Pulseaudio

```sh
./install install_pulseaudio
```

## Flatpak

```sh
sudo pacman -S flatpak
```

### Spotify

```sh
sudo pacman -S xdg-desktop-portal-gtk
flatpak install spotify
```

### Anki

```sh
flatpak install anki
```

## Development Tools

### C/C++

```sh
cd dotfiles
./install install_cpp_dev_tools
```

### Python

```sh
cd dotfiles
./install install_python_language_server
```

### Lua

```sh
sudo pacman -S lua luarocks lua-language-server
```

## Cleanup

```sh
rm -rf pabloariasal-dotfiles-XXX
```
