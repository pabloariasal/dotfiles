#
# ~/.bash_profile
#
export PATH="$PATH:/home/pablo/Documents/dotfiles/scripts"
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

