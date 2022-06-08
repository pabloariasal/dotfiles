# edit command in vi mpde with <c-x><c-e>
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# Navigate the dir stack back and forth with alt+h and alt+l
bindkey '^[h' insert-cycledleft
bindkey '^[l' insert-cycledright

# In vi mode, mode to the beginning of end of the line
bindkey -M vicmd '^[h' beginning-of-line
bindkey -M vicmd '^[l' end-of-line

# Fix vi mode backspace behavior
bindkey -v '^?' backward-delete-char

# cp to bookmarked directory
bindkey -r '^O'
bindkey '^O' zfm-cd-to-bookmark
