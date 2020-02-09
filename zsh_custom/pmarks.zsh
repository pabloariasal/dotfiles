# function pmarks-insert-bookmark-file()
# {
# 	_pmarks_insert "$(./pmarks.sh --select-files)"
# }
# zle     -N    pmarks-insert-bookmark-file
# bindkey '\ef' pmarks-insert-bookmark-file

# function pmarks-insert-bookmark-dir()
# {
# 	_pmarks_insert "$(./pmarks.sh --select-dirs)"
# }
# zle     -N    pmarks-insert-bookmark-dir
# bindkey '\ed' pmarks-insert-bookmark-dir

function pmarks-insert-bookmark-dir()
{
	_pmarks_insert "$(pmarks --select)"
}
zle     -N    pmarks-insert-bookmark-dir
bindkey '\eb' pmarks-insert-bookmark-dir

function _pmarks_insert()
{
	if [[ -z "$1" ]]; then
		zle fzf-redraw-prompt
		return 0
	fi
	LBUFFER="${LBUFFER}$(echo "$1" | tr '\r\n' ' ')"
	local ret=$?
	zle fzf-redraw-prompt
	return $ret
}
