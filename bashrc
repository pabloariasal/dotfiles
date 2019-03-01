#
# ~/.bashrc
#
alias 'ls=ls --color=auto'
alias ll='ls -l'
alias n='nvim'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

export PATH="$PATH:/home/pablo/.gem/ruby/2.4.0/bin"

# Autojump Settings
[[ -r "/usr/share/autojump/autojump.bash" ]] && source /usr/share/autojump/autojump.bash

#History
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Default text editor
export VISUAL=nvim

# RTV reads some ENV variables to open links
export RTV_BROWSER=qutebrowser

#FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAUTL_OPTS='--height 40% --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[[ -r "/usr/share/fzf/key-bindings.bash" ]] && source /usr/share/fzf/key-bindings.bash
[[ -r "/usr/share/fzf/completion.bash" ]] && source /usr/share/fzf/completion.bash

