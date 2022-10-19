set -e

ln -sfv "${DOTFILES}/alacritty/colors/dracula.yml" ${HOME}/.alacritty_colors.yml
echo "dracula" > ~/.nvim_colorscheme.txt
echo "dark" > ~/.nvim_background.txt
echo "nvim colorscheme: " && cat ~/.nvim_colorscheme.txt
echo "nvim backgroud: " && cat ~/.nvim_background.txt
