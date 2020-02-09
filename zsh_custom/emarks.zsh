# function emarks-insert-bookmark-file()
# {
# 	_emarks_insert "$(./emarks.sh --select-files)"
# }
# zle     -N    emarks-insert-bookmark-file
# bindkey '\ef' emarks-insert-bookmark-file

# function emarks-insert-bookmark-dir()
# {
# 	_emarks_insert "$(./emarks.sh --select-dirs)"
# }
# zle     -N    emarks-insert-bookmark-dir
# bindkey '\ed' emarks-insert-bookmark-dir

function emarks-insert-bookmark-dir()
{
	_emarks_insert "$(emarks --select)"
}
zle     -N    emarks-insert-bookmark-dir
bindkey '\eb' emarks-insert-bookmark-dir

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
