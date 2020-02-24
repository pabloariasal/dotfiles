function hstr-show-hist() {
  BUFFER='hstr -- '${BUFFER}
  zle accept-line
}
zle -N hstr-show-hist

bindkey "\C-r" hstr-show-hist
bindkey -M vicmd "\C-r" hstr-show-hist

function hstr-show-favs() {
  BUFFER='hstr --favorites'${BUFFER}
  zle accept-line
}
zle -N hstr-show-favs

bindkey "\C-f" hstr-show-favs
bindkey -M vicmd "\C-f" hstr-show-favs

export HSTR_CONFIG=hicolor,blacklist,static-favorites

