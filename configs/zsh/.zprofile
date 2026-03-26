# Source Environment Variables
if [ -f ~/.env.sh ]; then
    source ~/.env.sh
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
  setrrate
fi

# On Arch, start x server...
if [[ -f /etc/os-release ]] && grep -q '^ID=arch$' /etc/os-release; then
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
  fi
fi
