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

# Blacklist certain commands to be written to history file
HISTORY_IGNORE="(n|s|l|l[slat]|cd|gs|gd|gdca|gapa|gl|glp|glg|glga|gca|gcan|gp|gp!|f *|yay)"

#######################################################################
# CTRL-F - Select History Favorite
__ffavorite() {
  local cmd="cat ${DOTFILES}/history_favorites"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --cycle --reverse $FZF_DEFAULT_OPTS" $(__fzfcmd)
  local ret=$?
  return $ret
}

fzf-history-favorite-widget() {
  LBUFFER="${LBUFFER}$(__ffavorite)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-favorite-widget
bindkey '^F' fzf-history-favorite-widget
