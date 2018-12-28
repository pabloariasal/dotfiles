#
# ~/.bashrc
#
alias "ls=ls --color=auto"

#I have to do this for some reason this file is not sourced properly
source /etc/profile.d/autojump.bash

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

export PATH="$PATH:/home/pablo/.gem/ruby/2.4.0/bin"

#History
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Default text editor
export VISUAL=nvim