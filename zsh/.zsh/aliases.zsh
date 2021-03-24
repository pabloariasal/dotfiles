# program shorcuts
alias n='nvim'
alias b='bat -p'
alias p='pacman'

# convenience
alias sudo='sudo '
alias ls='ls --color=tty'
alias ..='cd ..'

# commands
alias ipcheck='curl -s ifconfig.co/json | jq'
alias h='history -r -E -35'
alias td='cd ~/Dropbox && nvim -O ~/Dropbox/plan.md ~/Dropbox/todo.md'

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
alias sx='devour sxiv'

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
alias gf='git fetch'
alias gl='git log'
alias glp='git log --stat -p'
alias glg='git log --oneline --graph --decorate'
alias glgd='git log --oneline --graph --decorate HEAD origin/develop'
alias glgm='git log --oneline --graph --decorate HEAD origin/master'
alias glga='git log --oneline --graph --decorate --all'
alias gm='git merge'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force'
alias grb='git rebase'
alias gs='git stash'
alias grh='git reset --hard HEAD'
alias gb='git branch -vv'
alias gba='git branch --all -vv'
alias gcl='git clean -f -d'
