# program shorcuts
alias n='nvim'
alias nd='nvim .'
alias v='vifm'
alias b='bat --plain'
alias bookmarks='nvim ~/.bookmarks.txt'

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
alias l='eza'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias lal='eza -la'
alias lt='eza --tree'

# devour
alias za='devour zathura'
alias sx='devour sxiv'

# add ssh keys to agent
alias sag='ssh-add ~/.ssh/github_personal'

alias install_config='stow --verbose=2 -d configs -t ~ '

