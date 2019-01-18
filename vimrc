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
"   -> Custom Commands
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
"Don't change directory when opening file
let g:startify_change_to_dir = 0

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
"set number
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
"fast buffer change
nnoremap <Leader>b :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
nmap <F8> :TagbarToggle<CR>
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
"Turn off search highlight
nnoremap <Leader>c :noh<cr>
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
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('w0rp/ale')
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('tpope/vim-repeat')
call minpac#add('tommcdo/vim-exchange')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('majutsushi/tagbar')
"colors
call minpac#add('dracula/vim', {'name':'dracula'})
call minpac#add('junegunn/seoul256.vim')
call minpac#add('romainl/Apprentice')
call minpac#add('morhetz/gruvbox')
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('nanotech/jellybeans.vim')
"Folding
call minpac#add('tmhedberg/SimpylFold')
call minpac#add('nelstrom/vim-markdown-folding')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> :<C-u>FZF<CR>
nnoremap <c-n> :<C-u>Buffers<CR>

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
set foldnestmax=1
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
" => Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":W sudo saves the file (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null
