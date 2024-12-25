zmodload -i zsh/complist

setopt complete_in_word    # Complete from both ends of a word.
setopt always_to_end       # Move cursor to the end of a completed word.
setopt auto_menu           # Show completion menu on a successive tab press.
setopt auto_list           # Automatically list choices on ambiguous completion.
setopt auto_param_slash    # If completed parameter is a directory, add a trailing slash.
setopt extended_glob       # Needed for file modification glob modifiers with compinit
unsetopt menu_complete     # Do not autoselect the first completion entry.
unsetopt flow_control      # Disable start/stop characters in shell editor.

# enable menu for completion
zstyle ':completion:*' menu select

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Expand aliases with TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored

# case and hyphen insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

bindkey -M menuselect '^Y' accept-and-infer-next-history
bindkey -M menuselect '^E' send-break
bindkey -M menuselect '^U' undo
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit
compinit

# complete hidden files
_comp_options+=(globdots)
