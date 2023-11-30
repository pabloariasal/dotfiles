#######################################################################
# Fzf functions

# CTRL-E - Paste the selected git branch into the command line
__fbranch() {
  local cmd="git branch -a | grep -v HEAD"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --reverse "$@" |
  while read item; do
    echo -n "${(q)item}" | tr -d '\\+*' | awk '{print $1}' | sed "s/remotes\///"
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
__jump_to_worktree() {
  local cmd="git worktree list"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | $(__fzfcmd))"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  dir=$(echo $dir | awk '{ print $1 }')
  # make relative paths absolute to repo root
  if [[ ! "$dir" =~ ^/ ]]; then
    if [[ $(basename $(dirname $(pwd))) == ".worktrees" ]]; then
      # we are in <root>/.worktrees/branchX
      local repo_root="$(dirname $(dirname $(pwd)))"
    elif [[ $(basename $(pwd)) == ".worktrees" ]]; then
      # we are in <repo_root>/.worktrees
      local repo_root="$(dirname $(pwd))"
    else
      # we are in <repo_root>
      local repo_root="$(pwd)"
    fi
    dir="${repo_root}/${dir}"
  fi
  # zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N   __jump_to_worktree
bindkey '^b' __jump_to_worktree

#######################################################################
# Aliases
alias gr='git restore'
alias grs='git restore --staged'
alias gs='git status'
alias g='git status'
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
alias gf='git fetch --all --prune'
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
alias gbd='git branch -d'
alias gbdd='git branch -D'
alias gba='git branch --all -vv'
alias gcl='git clean -f -d'
alias gw='git worktree'
alias gwl='git worktree list'
alias ge='git commit --allow-empty -m "Empty commit"'

#######################################################################
# Functions

function gbcl() {
  git remote update --prune &&
  git branch -vv | grep -vE '^[*+]' | awk '/: gone]/{print $1}' | xargs git branch -D
}

function gwa() {
  mkdir -p .worktrees
  git worktree add "$@"
}

function __gwrel() {
    local parent_dir="$(basename $(dirname $(pwd)))"
    if [[ "$parent_dir" == ".worktrees" || "$(basename $(pwd))" == ".worktrees" ]]; then
      echo "Can only be run from repo's root"
      return 1
    fi
    if [[ $# -eq 0 ]]; then
      echo "worktree dir not provided"
      return 1
    fi
    local worktree_name="$(basename $1)"
    git-worktree-relative -w "$1" -r "$(pwd)/.git/worktrees/${worktree_name}"
}

function __gwabs() {
    local parent_dir="$(basename $(dirname $(pwd)))"
    if [[ "$parent_dir" == ".worktrees" || "$(basename $(pwd))" == ".worktrees" ]]; then
      echo "Can only be run from repo's root"
      return 1
    fi
    if [[ $# -eq 0 ]]; then
      echo "worktree dir not provided"
      return 1
    fi
    local worktree_name="$(basename $1)"
    git-worktree-absolute -w "$1" -r "$(pwd)/.git/worktrees/${worktree_name}"
}

# git worktree add new branch
# creates a new worktree with a new branch
function gwan() {
    if [ "$#" -eq 0 ]; then
      echo "No arguments provided."
      echo "usage: gwan <new_branch_name> [<worktree_name>]"
      return 1
    fi
    local parent_dir="$(basename $(dirname $(pwd)))"
    if [[ "$parent_dir" == ".worktrees" || "$(basename $(pwd))" == ".worktrees" ]]; then
      echo "Can only be run from repo's root"
      return 1
    fi
    if [ -z "$2" ]; then
      local worktree_path=".worktrees/${1}"
    else
      local worktree_path=".worktrees/${2}"
    fi
    gwa "$worktree_path" -b "$1" \
      && __gwrel "$worktree_path" \
      && echo "New worktree created in $worktree_path" \
      || echo "failed to create worktree"
}

# git worktree add existing branch
# creates a new worktree with an existing branch
function gwae() {
    if [ "$#" -eq 0 ]; then
      echo "No arguments provided."
      echo "usage: gwae <branch_name> [<worktree_name>]"
      return 1
    fi
    local parent_dir="$(basename $(dirname $(pwd)))"
    if [[ "$parent_dir" == ".worktrees" || "$(basename $(pwd))" == ".worktrees" ]]; then
      echo "Can only be run from repo's root"
      return 1
    fi
    if [ -z "$2" ]; then
      local worktree_path=".worktrees/${1}"
    else
      local worktree_path=".worktrees/${2}"
    fi
    gwa "$worktree_path" "$1" \
      && __gwrel "$worktree_path" \
      && echo "New worktree created in $worktree_path" \
      || echo "failed to create worktree"
}

# git worktree remove
function gwr() {
  local parent_dir="$(basename $(dirname $(pwd)))"
  if [[ "$parent_dir" == ".worktrees" || "$(basename $(pwd))" == ".worktrees" ]]; then
    echo "Can only be run from repo's root"
    return 1
  fi
  local worktrees="$(git worktree list | sed -n '1d;p' | $(__fzfcmd) --multi)"
  if [[ -z "$worktrees" ]]; then
    return 0
  fi
  echo "Remove following worktrees?"
  echo "$worktrees"
  printf '[y/n]? '
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "$worktrees" | while read line ; do
      local worktree_path=$(echo $line | awk '{ print $1 }')
      __gwabs "$worktree_path" \
        && git worktree remove --force "$worktree_path" \
        && echo "$worktree_path removed"
    done
  else
      echo "cancelled"
  fi
}
