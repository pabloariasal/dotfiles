set -e

ln -sfv "${DOTFILES}/alacritty/colors/seoul256_dark.yml" ${HOME}/.alacritty_colors.yml
echo "seoul256" > ~/.nvim_colorscheme.txt
echo "dark" > ~/.nvim_background.txt
echo "nvim colorscheme: " && cat ~/.nvim_colorscheme.txt
echo "nvim backgroud: " && cat ~/.nvim_background.txt
