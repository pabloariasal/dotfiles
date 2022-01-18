# program shorcuts
alias n='nvim'
alias b='bat -p'
alias p='pacman'

# convenience
alias sudo='sudo '
alias ls='ls --color=tty'
alias ..='cd ..'

# prompt before doing anything stupid
alias rm='rm -I'
alias mv='mv -i'

# commands
alias ipcheck='curl -s ifconfig.co/json | jq'
alias h='history -r -E -35'

# fast cd to directories
alias d="cd ${DOTFILES}"

# exa
alias l='exa'
alias la='exa -a'
alias ll='exa -la'
alias lt='exa --tree'

# devour
alias za='devour zathura'
alias gka='devour gitk --all --branches'
alias gk='devour gitk'
alias fe='devour feh'
alias sx='devour sxiv'

# add ssh keys to agent
alias sag='ssh-add ~/.ssh/github'

# do easy calculations on the terminal
calc() { echo "scale=2;$1" | bc; }

# create temporary dirs and files
function tmp()
{
  if [[ -z "$1" ]]; then
    nvim $(mktemp)
  else
    nvim $(mktemp --suffix ."$1")
  fi
}

# Toggle ctags file
function toggle_ctags()
{
  local file='.ctagsenable'
  if [[ -f $file ]]; then
    rm $file && echo "ctags disabled"
  else
    echo "fd -tf --strip-cwd-prefix" > $file && echo "ctags enabled"
  fi
}

# Git
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
alias glgd='git log --oneline --graph --decorate HEAD origin/develop'
alias glgm='git log --oneline --graph --decorate HEAD origin/master'
alias glga='git log --oneline --graph --decorate --all'
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force'
alias grb='git rebase'
alias gsta='git stash'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gb='git branch -vv'
alias gba='git branch --all -vv'
alias gcl='git clean -f -d'

function gclb() {
  git remote update --prune &&
  git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}
