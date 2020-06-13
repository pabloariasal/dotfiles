#FZF settings
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 60%'
export FZF_ALT_C_COMMAND="fd -td"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(bat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--height 90% --sort --preview 'echo {}' --preview-window down:3:wrap --bind '?:toggle-preview'"
source ${HOME}/.fzf-key-bindings.zsh
