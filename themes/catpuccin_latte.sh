set -e

ln -sfv "${DOTFILES}/alacritty/colors/catppuccin_latte.yml" ${HOME}/.alacritty_colors.yml
echo "catppuccin-latte" > ~/.nvim_colorscheme.txt
echo "light" > ~/.nvim_background.txt
