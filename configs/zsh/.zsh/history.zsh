autoload -Uz history-beginning-search-forward history-beginning-search-backward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# Immediatelly append to history file
setopt inc_append_history

#share history across sessions
setopt share_history

# don't overwrite history file but append
setopt append_history

# remove duplicated lines first when history is full
setopt hist_expire_dups_first

# ignore duplicate entries in history listing (even if not adjacent)
setopt hist_ignore_all_dups

# don't record an entry that was just recorded again
setopt hist_ignore_dups

# don't show adjacent duplicates when scrolling through history on the line editor
setopt hist_find_no_dups

# when expanding history (e.g. with !) don't execute directly but just populate input
setopt hist_verify

# save timestamp in history
setopt extended_history

# skip cmds with leading space from history
setopt hist_ignore_space

# Dont write duplicate entries in the history file:
setopt hist_save_no_dups
