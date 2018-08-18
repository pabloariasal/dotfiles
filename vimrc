"Defaults
set nocompatible
filetype indent plugin on
syntax on
set ignorecase
set smartcase
set autoindent
set backspace=indent,eol,start
set ruler
set encoding=utf-8
set showcmd
set wildmenu
set lazyredraw
set showmatch
set hidden
set showtabline=2 " Always display the tabline, even if there is only one tab
set t_Co=256

"Set leader
let mapleader = ","

"Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Identation
set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

"Keymaps
map Y y$

"Show white space
set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<
set list

"Plugins
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')
call minpac#add('dracula/vim', {'name':'dracula'})
call minpac#add('junegunn/seoul256.vim')
call minpac#add('romainl/Apprentice')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"Status line
set laststatus=2 " Always display the statusline in all windows

"Ctrlp Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"ctags
set tags+=tags;$HOME "Look for tags acendengly until HOME is reached
nnoremap <f5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.git --exclude=build .
