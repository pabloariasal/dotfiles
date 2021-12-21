FD_HIDDEN="--hidden -E '.git'"
FD_EXTRA_OPTS="--strip-cwd-prefix"

# per default find only files including hidden ones, but not those in .git directory
export FZF_DEFAULT_COMMAND="fd -tf $FD_HIDDEN $FD_EXTRA_OPTS"
export FZF_DEFAULT_OPTS='--cycle --height 60%'

# Jump to subdirectory (includes hidden directories)
# <c-space> remove hidden directories from the view
# <c-r> resets to the default view
export FZF_ALT_C_COMMAND="fd -td $FD_HIDDEN $FD_EXTRA_OPTS"
export FZF_ALT_C_OPTS="--bind='ctrl-space:reload(fd -td $FD_EXTRA_OPTS)' --bind='ctrl-r:reload($FZF_ALT_C_COMMAND)'"

# fuzzy-find files and directories and enter them in the current command line buffer (including hidden elements)
# <c-space> remove hidden elements from the view
# <c-d> shows only directories (including hidden)
# <c-r> reset to default view
export FZF_CTRL_T_COMMAND="fd $FD_HIDDEN $FD_EXTRA_OPTS"
export FZF_CTRL_T_OPTS="--bind='ctrl-space:reload(fd $FD_EXTRA_OPTS)' --bind='ctrl-r:reload($FZF_CTRL_T_COMMAND)' --bind='ctrl-d:reload(fd -td $FD_HIDDEN $FD_EXTRA_OPTS)'"

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
