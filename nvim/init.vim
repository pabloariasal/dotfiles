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
"   -> Statusline
"   -> Spellcheck
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
set path+=$HOME/dotfiles/**,$HOME/Workspace/**
" persist undo history
set undofile
let g:startify_change_to_vcs_root = 1

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
"show possible matches above command line with TAB
set wildmenu
" highlight ranges composed of line numbers
let g:traces_num_range_preview = 1
set splitright
set splitbelow
" don't auto resize quickfix window
let g:qf_auto_resize = 0
"show files in a wide style in netrw
let g:netrw_liststyle = 3
"remove banner in netrw
let g:netrw_banner = 0
" Close annoying netrw buffers https://github.com/tpope/vim-vinegar/issues/13
autocmd FileType netrw setl bufhidden=delete

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
"Toggle location and quickfix lists
nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <Leader>l <Plug>(qf_loc_toggle)
"Close preview window
nnoremap <Leader>cp :<C-u>pclose<CR>
" Open buffer deletion menu
nnoremap <silent> <Leader>bd :<C-u>CloseBuffersMenu<CR>
"Easy grepping
nnoremap <Leader>g :<C-u>grep! 
"Grep word under the cursor
nnoremap <Leader>s :<C-u>grep! <C-r><C-w>

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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-exchange'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'romainl/vim-qf'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-obsession'
Plug 'markonm/traces.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'mhinz/vim-startify'
Plug 'neomake/neomake'
"colors
Plug 'rafi/awesome-vim-colorschemes'
"Folding
Plug 'tmhedberg/SimpylFold'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> :<C-u>FZF<CR>
nnoremap <c-n> :<C-u>Buffers<CR>
nnoremap <Leader>t :<C-u>Tags<CR>
nnoremap <Leader>d :<C-u>BTags<CR>

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
let g:UltiSnipsEnableSnipMate = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"use space to toggle folds
nnoremap <Space> za
vnoremap <Space> za
"don't allow nested folds
set foldmethod=syntax
set foldnestmax=2
set nofoldenable
set foldlevel=1
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
" Note: a compilation database must exist in the current dir for clang analyzers to work
let g:neomake_cpp_enabled_makers = ['clangtidy', 'clangcheck']
" Run linting when saving and loading buffers
call neomake#configure#automake('rw')
" Change to build directory
let g:neomake_makeprg_args = ['-C', 'build', '--silent']
" Open and jump to quickfix list after compilation
let g:neomake_makeprg_open_list = 1
" Remove entries that don't match the error format
call neomake#config#set('maker_defaults.remove_invalid_entries', 1)
" For some reason I have to set this explicitly for makeprg
let g:neomake_makeprg_remove_invalid_entries = 1
" Enable logging
let g:neomake_logfile = '/tmp/neomake.log'

let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'NeomakeErrorSign',
      \ }
let g:neomake_warning_sign = {
      \   'text': '>>',
      \   'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_message_sign = {
      \   'text': '>>',
      \   'texthl': 'NeomakeMessageSign',
      \ }
let g:neomake_info_sign = {
      \ 'text': 'ℹ',
      \ 'texthl': 'NeomakeInfoSign'
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%F
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%{b:gitbranch}
set statusline+=\ 
set statusline+=%{NeomakeStatus()}
set statusline+=\ 
set statusline+=%{coc#status()}
set statusline+=%=
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
set statusline+=%y
set statusline+=\ 
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%P

function! NeomakeStatus()
  return neomake#statusline#get(g:actual_curbuf, {
	    \ 'use_highlights_with_defaults': 0,
	    \ 'format_running':'({{running_job_names}})…',
	    \ 'format_status': '[%s]',
	    \ 'format_loclist_unknown': '-'
	    \})
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="[".substitute(l:gitrevparse, '\n', '', 'g')."] "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set American English as dictionary (for word completion)
set dictionary+=/usr/share/dict/american-english
nnoremap <Leader>se :setlocal spell spelllang=en_us<CR>
nnoremap <Leader>sg :setlocal spell spelllang=de_20<CR>
