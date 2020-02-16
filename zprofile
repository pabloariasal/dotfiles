# Add custom scripts to the path so that dmenu finds them
export DOTFILES="${HOME}/dotfiles"
export PATH="$PATH:${DOTFILES}/scripts:${DOTFILES}/scripts/webapps:${HOME}/bin:${HOME}/.gem/ruby/2.6.0/bin"
export CHROMIUM_EXEC=chromium
# Start x server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
