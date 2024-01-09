"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
" Required Tools: ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Load plugins per filetype
filetype plugin on
filetype plugin indent on

let g:traces_num_range_preview = 1

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
let g:vifm_replace_netrw = 1
let g:vifm_exec_args = "-c :only"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix and Location lists
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:qf_max_height = 20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable spell checkinf for markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
"Open help bufers on the right per default
autocmd FileType help wincmd L
"Don't show numbers on terminal buffers (needed for fzf)
autocmd TermOpen * setlocal nonumber norelativenumber
" autoclose scratchpad window
autocmd CompleteDone * pclose
