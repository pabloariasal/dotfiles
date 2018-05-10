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
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-surround'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
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
"Open explorer if no args were provided
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END

"nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

"LSP settings
let g:LanguageClient_serverCommands = {
    \ 'c': ['cquery'],
    \ 'cpp': ['cquery'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('$HOME/Documents/dotfiles/vim/lsp-settings.json')

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
