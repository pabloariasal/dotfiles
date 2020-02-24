# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

source ${DOTFILES}/zsh/history.zsh
source ${DOTFILES}/zsh/hstr.zsh
source ${DOTFILES}/zsh/fzf.zsh
source ${DOTFILES}/zsh/completion.zsh
source ${DOTFILES}/zsh/wal.zsh
source ${DOTFILES}/zsh/aliases.zsh
source ${DOTFILES}/zsh/directories.zsh
source ${DOTFILES}/zsh/antigen.zsh

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# Navigate the dir stack back and forth with alt+h and alt+l
bindkey '^[h' insert-cycledleft
bindkey '^[l' insert-cycledright

setopt correct

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

pfetch
