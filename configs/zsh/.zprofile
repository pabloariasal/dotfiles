# Source Environment Variables
if [ -f ~/.env ]; then
    . ~/.env
fi
setrrate

# Start x server
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
