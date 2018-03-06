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
set hlsearch
set wildmenu
set lazyredraw
set showmatch

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
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-surround'
call plug#end()

"Powerline settings
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the
set t_Co=256

"Colorscheme
colorscheme elflord

"Ctrlp Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_global_ycm_extra_conf'
nnoremap <leader>jd :YcmCompleter GoTo<CR>

"nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
