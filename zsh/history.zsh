autoload -Uz history-beginning-search-forward history-beginning-search-backward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt share_history
setopt append_history
setopt inc_append_history

# setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_ignore_dups # adjacent duplicates
setopt hist_find_no_dups

setopt hist_verify

