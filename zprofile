# Source Environment Variables
export DOTFILES="${HOME}/dotfiles"
if [ -f "$DOTFILES/environment" ]; then
    . "$DOTFILES/environment"
fi

# Start x server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
