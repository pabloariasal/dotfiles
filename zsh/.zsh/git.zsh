#######################################################################
# CTRL-E - Paste the selected git branch into the command line
__fbranch() {
  local cmd="git branch -a | grep -v HEAD"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --reverse --preview-window=down  --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' "$@" |
    while read item; do
    echo -n "${(q)item} " | awk '{print $1}' | sed "s/remotes\///"
  done
  local ret=$?
  echo
  return $ret
}

fzf-git-branch-widget() {
  LBUFFER="${LBUFFER}$(__fbranch)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-git-branch-widget
bindkey '^E' fzf-git-branch-widget

#######################################################################
# CTRL-S - Paste the selected git file into the command line
__gitfile() {
  local cmd="git -c color.status=always status --short"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --multi --reverse  --ansi --nth 2..,.. --preview-window=down --preview  '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
  cut -c4- | sed 's/.* -> //'  "$@" |
  while read item; do
    echo -n "${(q)item} " | awk '{print $NF}' | tr '\r\n' ' '
  done
  local ret=$?
  echo
  return $ret
}

fzf-git-file-widget() {
  LBUFFER="${LBUFFER}$(__gitfile)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-git-file-widget
bindkey '^s' fzf-git-file-widget
