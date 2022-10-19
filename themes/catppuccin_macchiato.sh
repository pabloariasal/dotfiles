set -e

ln -sfv "${DOTFILES}/alacritty/colors/catppuccin_macchiato.yml" ${HOME}/.alacritty_colors.yml
echo "catppuccin" > ~/.nvim_colorscheme.txt
echo "dark" > ~/.nvim_background.txt
