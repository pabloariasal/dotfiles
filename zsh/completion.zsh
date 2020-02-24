zmodload -i zsh/complist

setopt complete_in_word    # Complete from both ends of a word.
setopt always_to_end       # Move cursor to the end of a completed word.
setopt auto_menu           # Show completion menu on a successive tab press.
setopt auto_list           # Automatically list choices on ambiguous completion.
setopt auto_param_slash    # If completed parameter is a directory, add a trailing slash.
setopt extended_glob       # Needed for file modification glob modifiers with compinit
unsetopt menu_complete     # Do not autoselect the first completion entry.
unsetopt flow_control      # Disable start/stop characters in shell editor.

zstyle ':completion:*' menu select
bindkey -M menuselect '^O' accept-and-infer-next-history

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -Uz compinit
compinit
