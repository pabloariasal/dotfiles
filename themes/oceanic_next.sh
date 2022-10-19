set -e

ln -sfv "${DOTFILES}/alacritty/colors/oceanic_next.yml" ${HOME}/.alacritty_colors.yml
echo "OceanicNext" > ~/.nvim_colorscheme.txt
echo "dark" > ~/.nvim_background.txt
echo "nvim colorscheme: " && cat ~/.nvim_colorscheme.txt
echo "nvim backgroud: " && cat ~/.nvim_background.txt
