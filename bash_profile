#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add custom scripts to the path so that dmenu finds them
export PATH="$PATH:/home/pablo/dotfiles/scripts"

# Start x server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

