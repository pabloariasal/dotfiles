#FZF settings
COMMON_FD_OPTS='--hidden -E ".git"'
export FZF_DEFAULT_COMMAND="fd -tf ${COMMON_FD_OPTS}"
export FZF_DEFAULT_OPTS='--cycle --height 60%'
export FZF_ALT_C_COMMAND="fd -td ${COMMON_FD_OPTS}"
export FZF_CTRL_T_COMMAND="fd ${COMMON_FD_OPTS}"
export FZF_CTRL_R_OPTS="--no-height --no-reverse --exact --preview 'echo {}' --preview-window down:3:wrap --bind '?:toggle-preview'"
source ${HOME}/.fzf-key-bindings.zsh
bindkey '^n' fzf-file-widget
bindkey '^k' fzf-cd-widget

edit-fuzzy() {
  local sel=$(__fsel)
  if [[ -z "$sel" ]]; then
    local ret=$?
    zle reset-prompt
    return $ret
  fi
  LBUFFER="${EDITOR} ${sel}"
  zle reset-prompt
  zle accept-line
  local ret=$?
  return $ret
}
zle     -N   edit-fuzzy
bindkey '^p' edit-fuzzy
