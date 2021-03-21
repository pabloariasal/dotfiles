autoload -Uz history-beginning-search-forward history-beginning-search-backward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

#share history across sessions
setopt share_history
# don't overwrite history file but append
setopt append_history
# remove duplicated lines first when history is full
setopt hist_expire_dups_first
# ignore duplicate entries in history listing (even of not adjacent)
setopt hist_ignore_all_dups
# don't show adjacent duplicates when scrolling through history on the line editor
setopt hist_find_no_dups
# when expanding history (e.g. with !) don't execute directly but just populate input
setopt hist_verify
# save no duplicates in hist file
#setopt hist_save_no_dups
# extended history
setopt extended_history
# skip cmds with leading space from history
setopt hist_ignore_space
# Treated as a pattern at the time history files are written
CMD_HISTORY_IGNORE="d|n|paru"
GIT_HISTORY_IGNORE="gs|gd|gsta|gsta *|gdca|gapa|gl|glg|glg[dma]|gca|gcan|gp|gpf|gpu|gb|gba|grh|gm"
LS_HISTORY_IGNORE="l|l[slat]"
HISTORY_IGNORE="($CMD_HISTORY_IGNORE|$GIT_HISTORY_IGNORE|$LS_HISTORY_IGNORE)"
