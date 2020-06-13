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
set path+=$HOME/dotfiles/**,$HOME/Workspace/**

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

"[coc.nvim] Highlight symbol under cursor (requires highlight extension)
autocmd CursorHold * silent call CocActionAsync('highlight')

"[vim-qf] don't shrink quickfixlist
let g:qf_auto_resize = 0

"Enable syntax highlighting
syntax on

" show line numbers
set number

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
" Folding
"
" Required Plugins: tmhedberg/SimpylFold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Don't nest more than 3 folds
set foldnestmax=3
"Don't open folds per default
set nofoldenable
"When enabled, fold at top-level
set foldlevel=1
"[tmhedberg/SimpylFold] don't fold python docstrings
let g:SimpylFold_fold_docstring = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"
" Required Plugins: itchyny/lightline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
"
" Required Plugins: ludovicchabant/vim-gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[ludovicchabant/vim-gutentags] Don't generate a tags file automatically
let g:gutentags_add_default_project_roots = 0
"[ludovicchabant/vim-gutentags] To enable ctags create a .ctagsenable file in the project root
let g:gutentags_project_root = ['.ctagsenable']
"[ludovicchabant/vim-gutentags] Pass the paths to exclude to the ctag invocation
if !empty(glob(".ctagsignore"))
	let g:gutentags_ctags_exclude = ['@.ctagsignore']
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Needed for coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)
