#FZF settings
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_ALT_C_COMMAND="fd -td"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--height 90% --sort --exact --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
source ${HOME}/.fzf-key-bindings.zsh
