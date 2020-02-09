#FZF settings
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C cd into commond directory
export FZF_ALT_C_COMMAND="fd -td"
[[ -r "/usr/share/fzf/key-bindings.zsh" ]] && source /usr/share/fzf/key-bindings.zsh

# CTRL-O - Paste the selected git branch into the command line
__fbranch() {
  local cmd="git branch -a | grep -v HEAD"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) "$@" | while read item; do
    echo -n "${(q)item} " | awk '{print $1}' | sed "s/remotes\///"
  done
  local ret=$?
  echo
  return $ret
}

fzf-branch-widget() {
  LBUFFER="${LBUFFER}$(__fbranch)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-branch-widget
bindkey '\eo' fzf-branch-widget

# ALT-P - cd into subdirectory
fzf-cd-subdir-widget() {
  local cmd="command emarks --list-dirs 2> /dev/null"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$dir"
  local ret=$?
  zle fzf-redraw-prompt
  return $ret
}
zle     -N    fzf-cd-subdir-widget
bindkey '\ep' fzf-cd-subdir-widget
