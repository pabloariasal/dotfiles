"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
" Required Tools: ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Load plugins per filetype
filetype plugin on
filetype plugin indent on

"Enable syntax highlighting
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove banner in netrw
let g:netrw_banner = 0

"Show files in a wide style in netrw
let g:netrw_liststyle = 3
"disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
"use vifm instead
" let g:vifm_replace_netrw = 1
" let g:vifm_exec_args = "-c :only"
