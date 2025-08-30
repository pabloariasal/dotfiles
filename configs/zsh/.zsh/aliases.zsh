# program shorcuts
alias n='nvim'
alias nd='nvim .'
alias b='bat --plain'

# convenience
alias sudo='sudo '
alias ..='cd ..'
alias d='cd $DOTFILES'

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

# add ssh keys to agent
alias sag='ssh-add ~/.ssh/github_personal'

alias install_config='ensure_dots_dir && stow --verbose=2 -d configs -t ~ '
alias ssh_config='nvim ~/.ssh/config'

# Linux only aliases
if [[ $OSTYPE == 'linux'* ]]; then
  alias v='vifm'

  # devour
  alias za='devour zathura'
  alias iv='devour eog'
fi

