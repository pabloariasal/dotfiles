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
call minpac#add('vim-airline/vim-airline')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"Airline settings
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Colorscheme
colorscheme elflord

"Ctrlp Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"ctags
set tags+=tags;$HOME "Look for tags acendengly until HOME is reached
nnoremap <f5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.git --exclude=build .
