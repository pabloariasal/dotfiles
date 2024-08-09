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

__flocalbranch() {
  local cmd="git branch"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --reverse "$@" |
  while read item; do
    echo -n "${(q)item}" | tr -d '\\+*' | tr -d ' '
  done
  local ret=$?
  echo
  return $ret
}

fzf-git-checkout-local-branch-widget() {
  local branch=$(__flocalbranch)
  if [[ -z "$branch" ]]; then
    local ret=$?
    zle reset-prompt
    return $ret
  fi
  LBUFFER="git checkout ${branch}"
  zle reset-prompt
  zle accept-line
  local ret=$?
  return $ret
}
zle     -N   fzf-git-checkout-local-branch-widget
bindkey '^b' fzf-git-checkout-local-branch-widget

#######################################################################
# Aliases
alias gr='git restore'
alias grp='git restore -p'
alias grs='git restore --staged'
alias grsp='git restore --staged -p'
alias g='git status'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit -v --amend'
alias gcan='git commit -v --no-edit --amend'
# Changes only contents but no commit message of a previous commit
alias gcf='git commit --fixup'
alias gcfi='git log -n 50 --pretty=format:"%h %s" --no-merges | fzf --reverse | cut -c -7 | xargs -o git commit --fixup'
alias gs='git switch'
alias gsc='git switch -c'
alias gco='git checkout'
alias gso='git show'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='DELTA_FEATURES="+side-by-side" git diff'
alias gf='git fetch --all --prune'
alias gl='git log'
alias glp='git log --stat -p'
alias glpl='git log -p -5'
alias glpo='git log -p -1'
alias gls='git log --stat'
alias glg='git log --oneline --graph --decorate'
alias glgm='git log --oneline --graph --decorate HEAD origin/master'
alias glga='git log --oneline --graph --decorate --all'
alias glo='git log --oneline --decorate'
alias glh="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN%C(auto)%d %Creset%s' --date=relative --date-order"
alias gll="git log --pretty='%C(yellow)%h %Cblue%aN%C(auto)%d %Creset%s' -12"
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force'
alias gpfl='git push --force-with-lease'
alias grb='git rebase'
alias grbi='git rebase --interactive --autosquash'
alias gsta='git stash'
# stash also untracked files
alias gstaa='git stash --all'
alias gstal='git stash list'
alias gstac='git stash clear'
alias grh='git reset HEAD'
alias grha='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gb='git branch -vv'
alias gba='git branch --all -vv'
alias gbr='git for-each-ref --color=always --sort="-committerdate:iso8601" --format="%(color:green)%(committerdate:relative)%(color:reset)|%(color:blue)%(committername)%(color:reset)|%(refname:short)" refs/remotes/ | column -s "|" -t | less -R -F'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcl='git clean -f -d'
alias ge='git commit --allow-empty -m "Empty commit"'
alias gce='git config --local user.email'
alias gk='gitk'

#######################################################################
# Functions

# Remove branches not present in the remotes anymore
function gbcl() {
  git remote update --prune &&
  git branch -vv | grep -vE '^[*+]' | awk '/: gone]/{print $1}' | xargs git branch -D
}

# Deletes a branch in the remote
function gbdr() {
  git push ${2:-origin} ":${1}"
}

# show stats of a stash
function gstas() {
  git stash show -u stash@\{${1}\}
}

# show diff of a stash
function gstad() {
  git stash show -u -p stash@\{${1}\}
}

# Copy hash to clipboard
function gch() {
  local sel=$(git log --pretty=format:"%H %s (%an)" $1 | fzf --reverse)
  hsh="$(echo "${sel}" | awk '{ print $1 }')"
  if [ -z "$hsh" ]; then
    return 0
  fi
  echo "$hsh" | xclip -r -selection clipboard
  echo \'"$hsh"\' copied to clipboard!
}

# Change both contents and commit message of a previous commit
function gcfa() {
  git commit --fixup=amend:"${1}"
}

# Change commit message only of a previous commit
function gcfr() {
  git commit --fixup=reword:"${1}"
}
