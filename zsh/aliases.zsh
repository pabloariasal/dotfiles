alias n='nvim'
alias b='bat'
alias sudo='sudo '
alias p='pacman'
alias ls='ls --color=tty'
alias ..='cd ..'
alias ipcheck='curl -s ifconfig.co/json | jq'
alias h='history -r -E -1000 | less'
alias td='nvim ~/Dropbox/todo.md'

# exa
alias l='exa'
alias la='exa -a'
alias ll='exa -la'
alias lt='exa --tree'

# devour
alias za='devour zathura'
alias fx='devour feh'
alias gka='devour gitk --all --branches'
alias gk='devour gitk'

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

# Git
alias g='git'
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
alias gf='git fetch'
alias gl='git log'
alias glp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glg='git log --oneline --graph --decorate'
alias glga='git log --oneline --graph --decorate --all'
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias 'gp!'='git push --force'
alias grb='git rebase'
alias gs='git status'
alias gsta='git stash'
alias 'gr!'='git reset --hard HEAD'
alias gb='git branch -vv'
alias gba='git branch --all -vv'
