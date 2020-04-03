_list_notes() {
  local cmd="fd . $NOTES_DIR"
  setopt localoptions pipefail no_aliases 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

fzf-notes() {
  LBUFFER="${LBUFFER}$(_list_notes)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-notes
bindkey '^N' fzf-notes
