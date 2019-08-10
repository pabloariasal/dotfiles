#
# ~/.bashrc
#

PS1='[\u@\h \W]\$ '

# Aliases
alias ls='exa'
alias n='nvim'
alias e='exa'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

#History
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s cmdhist

# Default text editor
export VISUAL=nvim
export EDITOR=nvim

# fasd settings
eval "$(fasd --init posix-alias bash-hook)"
alias o='fasd -fR -e nvim'
alias b='fasd -fR -e bat'
alias j='fasd_cd -d'

#FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fasd -Rld"
[[ -r "/usr/share/fzf/key-bindings.bash" ]] && source /usr/share/fzf/key-bindings.bash
[[ -r "/usr/share/fzf/completion.bash" ]] && source /usr/share/fzf/completion.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
