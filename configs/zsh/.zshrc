# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

source ~/.zsh/plugins.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/directories.zsh
source ~/.zsh/git.zsh
source ~/.zsh/bindings.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/neovim_development.zsh

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# prompt
autoload -Uz promptinit && promptinit && prompt powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function py() {
    python3 -c "from math import *; print($*)"
}

# source haskell environment
[ -f "${HOME}/.ghcup/env" ] && source "${HOME}/.ghcup/env"

if [ -n "$GREET" ]; then
  neofetch
  cal -m -n 2 --color=always
  figlet "Welcome!"
  return 0
fi

if [ -z "$NO_LWD" ]; then
  # switch to last visited directory
  lwd
fi
