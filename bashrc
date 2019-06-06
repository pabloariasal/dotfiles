#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
HISTSIZE=5000
HISTFILESIZE=10000

# Default text editor
export VISUAL=nvim
export EDITOR=nvim

# RTV reads some ENV variables to open links
export RTV_BROWSER=chromium

#FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[[ -r "/usr/share/fzf/key-bindings.bash" ]] && source /usr/share/fzf/key-bindings.bash
[[ -r "/usr/share/fzf/completion.bash" ]] && source /usr/share/fzf/completion.bash
alias of="fzf | xargs -r nvim"
alias bf="fzf | xargs -r bat"

# Fasd
eval "$(fasd --init posix-alias bash-hook)"
alias o='fasd -fR -e nvim'
alias b='fasd -fR -e bat'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
