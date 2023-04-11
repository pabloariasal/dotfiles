#######################################################################
# Fzf functions

# CTRL-E - Paste the selected git branch into the command line
__fbranch() {
  local cmd="git branch -a | grep -v HEAD"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --reverse "$@" |
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

# CTRL-S - Paste the selected git file into the command line
__gitfile() {
  local cmd="git -c color.status=always status --short"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --multi --reverse  --ansi --nth 2..,.. |
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

# CTRL-B - Jump to worktree
__select_git_worktree() {
  local cmd="git worktree list"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | $(__fzfcmd) | awk '{print $1}')"
  # make relative paths absolute to repo root
  if [[ ! "$path" =~ ^/ ]]; then
    local repo_root="$(git rev-parse --show-toplevel)"
    dir="${repo_root}/${dir}"
  fi
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  # zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N   __select_git_worktree
bindkey '^b' __select_git_worktree

#######################################################################
# Aliases
alias gr='git restore'
alias grs='git restore --staged'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gc='git commit -v'
alias gcm='git commit -m'
alias 'gca'='git commit -v --amend'
alias 'gcan'='git commit -v --no-edit --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch --prune'
alias gl='git log'
alias glp='git log --stat -p'
alias gls='git log --stat'
alias glg='git log --oneline --graph --decorate'
alias glgd='git log --oneline --graph --decorate HEAD origin/dev'
alias glgm='git log --oneline --graph --decorate HEAD origin/master'
alias glga='git log --oneline --graph --decorate --all'
alias glo='git log --oneline'
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force'
alias grb='git rebase'
alias gsta='git stash'
alias grh='git reset HEAD'
alias grha='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gb='git branch -vv'
alias gba='git branch --all -vv'
alias gcl='git clean -f -d'
alias gw='git worktree'
alias gwl='git worktree list'
alias ge='git commit --allow-empty -m "Empty commit"'

#######################################################################
# Functions

function gclb() {
  git remote update --prune &&
  git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}

function gwa() {
  if [ ! -d ".worktrees" ]; then
    mkdir .worktrees
  fi
  git worktree add "$@"
}
