alias n='nvim'
alias b='bat'
alias sudo='sudo '
alias p='pacman'
alias ls='ls --color=tty'
alias ..='cd ..'
alias ipinfo='curl -s ifconfig.co/json | jq'

# exa
alias l='exa'
alias la='exa -a'
alias ll='exa -la'
alias lt='exa --tree'

#devour
alias za='devour zathura'
alias sx='devour sxiv'
alias gka='devour gitk --all --branches'
alias gk='devour gitk'

function s()
{
  if [[ $(pwd) == ${NOTES_DIR}/org ]]; then
    nvim -S ${HOME}/.org_session
  else
    nvim -S Session.vim
  fi
}
