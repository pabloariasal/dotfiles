# per default find only files including hidden ones, but not those in .git directory
export FZF_DEFAULT_COMMAND="fd -tf --hidden -E '.git'"
export FZF_DEFAULT_OPTS='--cycle --height 60%'

# Jump to subdirectory
# <c-space> shows hidden directories
# <c-r> hides hidden directories
export FZF_ALT_C_COMMAND="fd -td"
export FZF_ALT_C_OPTS="--bind='ctrl-space:reload(fd -td --hidden -E ".git")' --bind='ctrl-r:reload(fd -td)'"

# fuzzy-find files and directories and enter them in the current command line buffer
# <c-space> shows hidden elements
# <c-r> hides hidden elements
# <c-d> shows only directories (including hidden)
export FZF_CTRL_T_COMMAND="fd"
export FZF_CTRL_T_OPTS="--bind='ctrl-space:reload(fd --hidden -E ".git")' --bind='ctrl-r:reload(fd)' --bind='ctrl-d:reload(fd -td --hidden -E ".git")'"
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
