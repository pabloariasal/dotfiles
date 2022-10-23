set -e

ln -sfv "${DOTFILES}/alacritty/colors/catppuccin_frappe.yml" ${HOME}/.alacritty_colors.yml
echo "catppuccin-frappe" > ~/.nvim_colorscheme.txt
echo "dark" > ~/.nvim_background.txt
