"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"
" Required Plugins: itchyny/lightline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NOTE: each sublist is its own highlight group
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ 'active': {
                \ 'left': [
                \           [ 'paste' ],
                \           [ 'readonly', 'relativepath', 'modified' ]
                \         ],
                \ 'right': [
                \            [ 'percent', 'location' ],
                \            [ 'fileinfo', 'fileencoding']
                \          ]
                \        },
        \ 'component': {
              \   'location': '%l/%L',
              \   'fileinfo': '%y'
              \ },
            \ }
