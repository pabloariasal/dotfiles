# Source Environment Variables
export DOTFILES="${HOME}/dotfiles"
if [ -f ~/.env ]; then
    . ~/.env
fi
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Start x server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
