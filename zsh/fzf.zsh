#FZF settings
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 40%'
export FZF_ALT_C_COMMAND="fd -td"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source ${HOME}/.fzf-key-bindings.zsh

#######################################################################
# CTRL-A - Paste the selected git branch into the command line

__fbranch() {
  local cmd="git branch -a | grep -v HEAD"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) "$@" | while read item; do
    echo -n "${(q)item} " | awk '{print $1}' | sed "s/remotes\///"
  done
  local ret=$?
  echo
  return $ret
}

fzf-git-branch-widget() {
  LBUFFER="${LBUFFER}$(__fbranch)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   fzf-git-branch-widget
bindkey '^A' fzf-git-branch-widget

#######################################################################
# CTRL-P - cd into bookmarked directory
fzf-cd-subdir-widget() {
  local cmd="command emarks --list-dirs 2> /dev/null"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  cd "$dir"
  local ret=$?
  zle fzf-redraw-prompt
  return $ret
}
zle     -N    fzf-cd-subdir-widget
bindkey '^P' fzf-cd-subdir-widget

#######################################################################
# CTRL-B - insert bookmark
function _emarks_insert()
{
	if [[ -z "$1" ]]; then
		zle fzf-redraw-prompt
		return 0
	fi
	LBUFFER="${LBUFFER}$(echo "$1" | tr '\r\n' ' '| sed -e 's/\s$//')"
	local ret=$?
	zle fzf-redraw-prompt
	return $ret
}
function emarks-insert-bookmark()
{
	_emarks_insert "$(emarks --select)"
}
zle     -N    emarks-insert-bookmark
bindkey '^B' emarks-insert-bookmark

#######################################################################
# CTRL-F - Select History Favorite
__ffavorite() {
  local cmd="cat ${DOTFILES}/history_favorites"
  setopt localoptions pipefail 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS" $(__fzfcmd)
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
