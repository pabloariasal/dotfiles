# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

source ${DOTFILES}/zsh/antigen.zsh
source ${DOTFILES}/zsh/fzf.zsh
source ${DOTFILES}/zsh/history.zsh
source ${DOTFILES}/zsh/completion.zsh
source ${DOTFILES}/zsh/aliases.zsh
source ${DOTFILES}/zsh/directories.zsh
source ${DOTFILES}/zsh/git.zsh
source ${DOTFILES}/zsh/pfetch

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# Navigate the dir stack back and forth with alt+h and alt+l
bindkey '^[h' insert-cycledleft
bindkey '^[l' insert-cycledright

# Fix vi mode backspace behavior
bindkey -v '^?' backward-delete-char

setopt autocd

# edit command line command in vim with v
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

pfetch
