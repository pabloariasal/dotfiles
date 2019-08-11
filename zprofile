# Add custom scripts to the path so that dmenu finds them
export PATH="$PATH:${HOME}/dotfiles/scripts:${HOME}/bin"

# Start x server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
