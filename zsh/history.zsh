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
# ignore duplicate entries in history
setopt hist_ignore_all_dups
# when searching or scrolling through history
setopt hist_find_no_dups
# when expanding history (e.g. with !) don't execute directly but just populate input
setopt hist_verify
# save no duplicates in hist file
setopt hist_save_no_dups
# extended history
setopt extended_history
# skip cmds with leading space from history
setopt histignorespace

# Blacklist certain commands to be written to history file
HISTORY_IGNORE="(n|s|l|l *|l[slat]|cd|fm|gs|gd|gdca|gapa|gl|glp|glg|glga|gca|gcan|gp|gp!|f *|yay)"

export HSTR_CONFIG=hicolor,static-favorites
bindkey -s "^r" "^u hstr -- ^j"
