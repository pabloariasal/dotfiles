# Source Environment Variables
if [ -f ~/.env ]; then
    . ~/.env
fi
setrrate

# Start x server
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi
