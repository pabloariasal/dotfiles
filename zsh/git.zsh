#######################################################################
# CTRL-E - Paste the selected git branch into the command line
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

fzf-git-branch-widget() {
  LBUFFER="${LBUFFER}$(__fbranch)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-git-branch-widget
bindkey '^E' fzf-git-branch-widget

# Aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gc='git commit -v'
alias 'gca'='git commit -v --amend'
alias 'gcan'='git commit -v --no-edit --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias gka='\gitk --all --branches'
alias gk='\gitk'
alias gl='git log'
alias glp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glg='git log --oneline --graph --decorate'
alias glga='git log --oneline --graph --decorate --all'
alias gm='git merge'
alias gp='git push'
alias 'gp!'='git push --force'
alias grb='git rebase'
alias gs='git status'
alias gsta='git stash'
