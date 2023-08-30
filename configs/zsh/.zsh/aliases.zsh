# program shorcuts
alias n='nvim'
alias v='vifm'
alias b='bat --plain'

# convenience
alias sudo='sudo '
alias ..='cd ..'

# prompt before doing anything stupid
alias rm='rm -I'
alias mv='mv -i'

# commands
alias h='history -r -E -35'

# ls
alias ls='ls --color=tty'
alias l='exa'
alias la='exa -a'
alias ll='exa -l'
alias lla='exa -la'
alias lal='exa -la'
alias lt='exa -T'

# devour
alias za='devour zathura'
alias sx='devour sxiv'

# add ssh keys to agent
alias sag='ssh-add ~/.ssh/github_personal'

alias install_config='stow --verbose=2 -d configs -t ~ '

