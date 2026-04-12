# program shorcuts

if [ -x "$(command -v nvim)" ]; then
  alias n='nvim'
  alias nd='nvim .'
fi

if [ -x "$(command -v bat)" ]; then
  alias b='bat --plain'
fi

if [ -x "$(command -v batcat)" ]; then
  alias bat='batcat'
  alias b='batcat --plain'
fi

if [ -x "$(command -v vifm)" ]; then
  alias v='vifm -c only'
  alias vp='vifm -c view'
fi

# convenience
alias sudo='sudo '
alias ..='cd ..'
alias d='cd $DOTFILES'

# commands
alias h='history -r -E -35'

# ls
alias ls='ls --color=tty'

if [ -x "$(command -v eza)" ]; then
  alias l='eza'
  alias la='eza -a'
  alias ll='eza -l'
  alias lla='eza -la'
  alias lal='eza -la'
  alias lt='eza --tree'
fi

if [ -x "$(command -v exa)" ]; then
  alias l='exa'
  alias la='exa -a'
  alias ll='exa -l'
  alias lla='exa -la'
  alias lal='exa -la'
  alias lt='exa --tree'
fi

# add ssh keys to agent
alias sag='ssh-add ~/.ssh/github_personal'
alias ssh_config="${EDITOR} ~/.ssh/config"

if [ -x "$(command -v devour)" ]; then
  alias za='devour zathura'
  alias iv='devour eog'
fi

alias install_config='ensure_dots_dir && stow --verbose=2 -d configs -t ~ '
