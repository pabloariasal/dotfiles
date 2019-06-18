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

# Include z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#FZF settings
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -td --hidden"
[[ -r "/usr/share/fzf/key-bindings.bash" ]] && source /usr/share/fzf/key-bindings.bash
[[ -r "/usr/share/fzf/completion.bash" ]] && source /usr/share/fzf/completion.bash

j() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

# Modified version where you can press
#   - CTRL-B to open with `bat` command,
#   - CTRL-E or Enter key to open with the $EDITOR
o() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --select-1 --expect=ctrl-b,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-b ] && bat "$file" || ${EDITOR:-vim} "$file"
  fi
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
