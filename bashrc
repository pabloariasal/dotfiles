#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias n='nvim'
alias e='exa'
alias poc='nvim ~/dotfiles/polybar/config'
alias i3c='nvim ~/dotfiles/i3/config'
alias nvc='nvim ~/dotfiles/nvim/init.vim'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Autojump Settings
#[[ -r "/usr/share/autojump/autojump.bash" ]] && source /usr/share/autojump/autojump.bash
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#History
#HISTSIZE=5000
#HISTFILESIZE=10000
#shopt -s histappend
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Default text editor
export VISUAL=nvim

# RTV reads some ENV variables to open links
export RTV_BROWSER=chromium

#FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[[ -r "/usr/share/fzf/key-bindings.bash" ]] && source /usr/share/fzf/key-bindings.bash
[[ -r "/usr/share/fzf/completion.bash" ]] && source /usr/share/fzf/completion.bash

