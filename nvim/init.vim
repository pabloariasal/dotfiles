"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
" | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
" | | ____   ____  | || |     _____    | || | ____    ____ | || |  _______     | || |     ______   | |
" | ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| || | |_   __ \    | || |   .' ___  |  | |
" | |  \ \   / /   | || |      | |     | || |  |   \/   |  | || |   | |__) |   | || |  / .'   \_|  | |
" | |   \ \ / /    | || |      | |     | || |  | |\  /| |  | || |   |  __ /    | || |  | |         | |
" | |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | || |  _| |  \ \_  | || |  \ `.___.'\  | |
" | |     \_/      | || |    |_____|   | || ||_____||_____|| || | |____| |___| | || |   `._____.'  | |
" | |              | || |              | || |              | || |              | || |              | |
" | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
"  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
"
" Maintainer:
"   Pablo Arias - pabloariasal@gmail.com
"
" Sections:
"   -> General
"   -> User Interface
"   -> Colors
"   -> Key Maps
"   -> Searching
"   -> Indentation
"   -> Plugins
"   -> Fuzzy Search
"   -> Snippets
"   -> Folding
"   -> ctags
"   -> Linting
"   -> Autocompletion
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set encoding=utf-8
filetype plugin on
filetype indent on
"Configure backspace so it acts as it should act
set backspace=eol,start,indent
"Allow abandoning buffers without having to save them (useful for batch buffer modification, e.g. global search/replace)
set hidden
"Ignore files in .git, build dir, binary files, etc.
set wildignore=*.o,*~,*.pyc,*.swp
set wildignore+=*/.git/*,*/build*/*,*/dist/*
"automatically reload buffers when file changes on disk
set autoread
"Look for tags file acendingly until HOME is reached
set tags+=tags;$HOME
"Search for files in this directories, recursively
set path+=$HOME/Documents/**,$HOME/Workspace/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show white space
set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<
set list
"show current command
set showcmd
"Don't redraw screen while executing macros
set lazyredraw
"Show matching braket
set showmatch
"show current position in file
set ruler
"show line numbers
set number
"always display the statusline in all windows
set laststatus=2
"show files in a wide style in netrw
let g:netrw_liststyle = 3
"remove banner in netrw
let g:netrw_banner = 0
"show possible matches above command line with TAB
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable syntax highlighting
syntax on
"Set number of terminal colors to 256 (required by most colorschemes)
set t_Co=256

try
    colorscheme default
catch
endtry

set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set leader to ,
let mapleader=","
"but don't lose reverse motion
noremap \ ,
"make Y consistent with other motions
map Y y$
"convenient window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"open tagbar with f8
nmap <F8> :TagbarToggle<CR>
"Convenient system clipboard bindings
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y
"Easy grepping
nnoremap <Leader>g :<C-u>grep! 
"Grep word under the cursor
nnoremap <Leader>gc :<C-u>grep! <C-r><C-w>
"Toggle location and quickfix lists
nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <Leader>l <Plug>(qf_loc_toggle)
"Switch focus quickfix window
nmap <Leader>w <Plug>(qf_qf_switch)
"Close preview window
nnoremap <Leader>c :<C-u>pclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ignore case per default
set ignorecase
"If search pattern contains an upper case letter, make search case sensitive
set smartcase
"Show matches as you type
set incsearch
"Highlight matches
set hlsearch
"Set up RigGrep as external grepper
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copy indent from current line
set autoindent
"smart autoindenting
set smartindent
"one tab = 4 spaces
set tabstop=4
set shiftwidth=4
"use spaces instead of tabs
"set expandtab
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'romainl/vim-qf'
"colors
Plug 'dracula/vim', {'as':'dracula'}
Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
"Folding
Plug 'tmhedberg/SimpylFold'
Plug 'nelstrom/vim-markdown-folding'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> :<C-u>FZF<CR>
nnoremap <c-n> :<C-u>Buffers<CR>
nnoremap <Leader>t :<C-u>Tags<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-a>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"open personal snippet file in a vertical split
let g:UltiSnipsEditSplit="vertical"
"store personal snippets here. NOTE: must be in runtimepath
let g:UltiSnipsSnippetsDir="mysnippets"
"read snippets from the following directories. NOTE: dirs must be in runtmepath
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use space to toggle folds
nnoremap <Space> za
vnoremap <Space> za
"don't allow nested folds
set foldnestmax=2
"don't fold python docstrings
let g:SimpylFold_fold_docstring = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't generate tags every time you see a .git -.-
let g:gutentags_add_default_project_roots = 0
" To enable ctags create a .ctagsenable file in the project root
let g:gutentags_project_root = ['.ctagsenable']
" Pass the paths to exclude to the ctag invocation
if !empty(glob(".ctagsignore"))
	let g:gutentags_ctags_exclude = ['@.ctagsignore']
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Linting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_python_enabled_makers = ['pylint', 'pycodestyle', 'flake8']
"call neomake#configure#automake('rw', 500)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
"Enable dictionary completion
set dictionary+=/usr/share/dict/american-english
call deoplete#custom#option('ignore_sources', {'cpp': ['dictionary'], 'python': ['dictionary']})
let g:deoplete#sources#jedi#show_docstring = 1
