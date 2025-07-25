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

# CTRL-B - Paste the selected commit hash into the current command line
__commit_hash() {
  local cmd='git log --pretty=format:"%H %s" --no-merges'
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | $(__fzfcmd) --reverse | awk '{print $1}'
  while read item; do
    echo -n "${(q)item} " | awk '{print $NF}' | tr '\r\n' ' '
  done
  local ret=$?
  echo
  return $ret
}

fzf-commit-hash-widget() {
  LBUFFER="${LBUFFER}$(__commit_hash)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-commit-hash-widget
bindkey '^b' fzf-commit-hash-widget

#######################################################################
# Aliases
alias gr='git restore'
alias grp='git restore -p'
alias grs='git restore --staged'
alias grsp='git restore --staged -p'
alias g='git status'
alias ga='git add'
# stage all files (including untracked ones)
alias gaa='git add --all'
alias gapa='git add --patch'
# stage untracked files
alias gau='git add --update'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit -v --amend'
alias gcan='git commit -v --no-edit --amend'
alias gcap='git commit -v --no-edit --amend && git push --force'
# Changes only contents but no commit message of a previous commit
alias gcf='git commit --fixup'
alias gs='git switch'
alias gsc='git switch -c'
alias gco='git checkout'
alias gso='git show'
# git show with split diff
alias gsos='DELTA_FEATURES="+side-by-side +line-numbers" git show'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='DELTA_FEATURES="+side-by-side +line-numbers" git diff'
alias gf='git fetch --all --prune --tags'
alias gl='git log'
alias glp='git log --stat -p'
alias glps='DELTA_FEATURES="+side-by-side +line-numbers" git log --stat -p'
alias glpo='git log --patch -1'
alias gls='git log --stat'
alias glg='git log --oneline --graph --decorate'
alias glgm='git log --oneline --graph --decorate HEAD origin/master'
alias glga='git log --oneline --graph --decorate --all'
alias gll="git log --pretty='%C(yellow)%H %C(cyan)%cd %Cblue%aN%C(auto)%d %Creset%s' --decorate --date=relative --date-order -12"
alias glo="git log --pretty='%C(yellow)%H %C(cyan)%cd %Cblue%aN%C(auto)%d %Creset%s' --decorate --date=relative --date-order"
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force'
# git push safely
alias gps='git push --force-with-lease'
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
# show remote branches
alias gbr='git for-each-ref --color=always --sort="-committerdate:iso8601" --format="%(color:green)%(committerdate:relative)%(color:reset)|%(color:blue)%(committername)%(color:reset)|%(refname:short)" refs/remotes/ | column -s "|" -t | less -R -F'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcl='git clean -f -d'
alias ge='git commit --allow-empty -m "Empty commit"'
alias gce='git config --local user.email'
alias gceg='git config --local user.email pabloariasal@gmail.com'
alias gk='gitk'
alias gcp='git cherry-pick'

#######################################################################
# Functions

# Remove branches not present in the remotes anymore
function gbcl() {
  git remote update --prune &&
  for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
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

# Change both contents and commit message of a previous commit
function gcfa() {
  git commit --fixup=amend:"${1}"
}

# Change commit message only of a previous commit
function gcfr() {
  git commit --fixup=reword:"${1}"
}
