"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
" Required Tools: ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set encoding=utf-8

"Load plugins per filetype
filetype plugin on
filetype plugin indent on

"Allow abandoning buffers without having to save them (useful for batch buffer modification, e.g. global search/replace)
set hidden

"Ignore files in .git, build etc. when globbing or autocompleting
set wildignore=*.o,*~,*.pyc,*.swp
set wildignore+=*/.git/*

"Automatically reload buffers when file changes on disk
set autoread

"Search for files in this directories (e.g. via find, gf)
set path=.,,**

"Persist undo history
set undofile

"Set up RigGrep as external grepper
set grepprg=rg\ -H\ --no-heading\ --vimgrep

"Set format to populate quickfixlist
set grepformat=%f:%l:%c:%m

"Split to the right and below
set splitright
set splitbelow

"Show possible matches above command line with TAB
set wildmenu

" highlight line where cursor is
set cursorline

set relativenumber

" disable swap files
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look & Feel
"
" Required Plugins: traces.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show white space
set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<
set list

"Show current command
set showcmd

"Highlight matching braket
set showmatch

"Always display the statusline in all windows
set laststatus=2

"[traces.vim] Highlight line number ranges when writing ex commands
let g:traces_num_range_preview = 1

"Enable syntax highlighting
syntax on

" Enable hard mode per default
let g:hardtime_default_on = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove banner in netrw
let g:netrw_banner = 0

"Show files in a wide style in netrw
let g:netrw_liststyle = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Ignore case per default
set ignorecase
"If search pattern contains an upper case letter, make search case sensitive
set smartcase
"Show matches as you type
set incsearch
"Highlight matches
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart indentation for C-like languages
set smartindent
"Use spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=2
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix and Location lists
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:qf_max_height = 20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Building
"
" Required Plugins: vim-dispatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dispatch_no_maps = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"clear trialing white space
command! ClearWhitespace %s/\s\+$//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable spell checkinf for markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
"Open help bufers on the right per default
autocmd FileType help wincmd L
"Don't show numbers on terminal buffers (needed for fzf)
autocmd TermOpen * setlocal nonumber norelativenumber
