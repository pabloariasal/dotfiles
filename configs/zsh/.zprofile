# On systems where ZSH is not the login shell, add this to the existing ~/.profile
# source ~/.zprofile

# Source Environment Variables
if [ -f ~/.env.sh ]; then
    source ~/.env.sh
fi

# for linux systems that run a login manager and therefore don't use xinit/startx
if [ "$(uname)" != "Darwin" ] && [  -x "$(command -v setrrate)" ]; then
  setrrate
fi

# On Arch, start x server...
if [ -f /etc/arch-release ]; then
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
  fi
fi
