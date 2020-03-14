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
