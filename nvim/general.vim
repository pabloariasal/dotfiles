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
" Description:
"   General basic configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
" Required Tools: ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set encoding=utf-8

"Load plugins per filetype
filetype plugin on

filetype indent on

"Allow abandoning buffers without having to save them (useful for batch buffer modification, e.g. global search/replace)
set hidden

"Ignore files in .git, build etc. when globbing or autocompleting
set wildignore=*.o,*~,*.pyc,*.swp
set wildignore+=*/.git/*,*/build*/*,*/dist/*,build

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

"Add English as main dictionary
set dictionary+=/usr/share/dict/american-english

"English as default language
set spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"
" Required Plugins: traces.vim, coc.nvim, vim-qf, awesome-vim-colorschemes
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
"
" Required Plugins: tpope/vim-sleuth
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart indentation for C-like languages
set smartindent
"Use spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme dracula
set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Floating Terminal
"
" Required Plugins: voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Vifm FloatermNew vifm
let g:floaterm_height=0.95
let g:floaterm_width=0.8
let g:floaterm_position='top'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: fzf and fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9}}
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs
"
" Required Plugins: jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsMapSpace = 0
