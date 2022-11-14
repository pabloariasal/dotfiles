set -e

ln -sfv "${DOTFILES}/alacritty/colors/seoul256_light.yml" ${HOME}/.alacritty_colors.yml
echo "seoul256-light" > ~/.nvim_colorscheme.txt
echo "light" > ~/.nvim_background.txt
echo "nvim colorscheme: " && cat ~/.nvim_colorscheme.txt
echo "nvim backgroud: " && cat ~/.nvim_background.txt
