#FZF settings
COMMON_FD_OPTS='--hidden -E ".git"'
export FZF_DEFAULT_COMMAND='fd -tf ${COMMON_FD_OPTS}'
export FZF_DEFAULT_OPTS='--cycle --height 60%'
export FZF_ALT_C_COMMAND="fd -td"
export FZF_CTRL_T_COMMAND="fd ${COMMON_FD_OPTS}"
export FZF_CTRL_T_OPTS="--preview '(bat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--height 90% --sort --preview 'echo {}' --preview-window down:3:wrap --bind '?:toggle-preview'"
source ${HOME}/.fzf-key-bindings.zsh
bindkey '^n' fzf-file-widget
bindkey '^k' fzf-cd-widget
