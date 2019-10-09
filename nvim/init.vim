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
"   -> Language Server and Semantic Completion
"   -> ctags
"   -> Snippets
"   -> Folding
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
set wildignore+=*/.git/*,*/build*/*,*/dist/*,build
"automatically reload buffers when file changes on disk
set autoread
"Look for tags file acendingly until HOME is reached
set tags+=tags;$HOME
"Search for files in this directories, recursively
set path+=$HOME/dotfiles/**,$HOME/Workspace/**
" persist undo history
set undofile

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
"Convenient system clipboard bindings
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y
"Toggle location and quickfix lists
nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <Leader>l <Plug>(qf_loc_toggle)
nmap gq <Plug>(qf_qf_switch)
"Easy grepping
nnoremap <Leader>g :<C-u>grep! 
"Grep word under the cursor
nnoremap <Leader>r :<C-u>grep! <C-r><C-w>

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
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-obsession'
Plug 'markonm/traces.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-sleuth'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"colors
Plug 'rafi/awesome-vim-colorschemes'
"Folding
Plug 'tmhedberg/SimpylFold'
call plug#end()

" don't auto resize quickfix window
let g:qf_auto_resize = 0
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Server Protocol
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList --normal diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" search tags
nnoremap <silent> <leader>t  :<C-u>CocList tags<cr>
" search colors
nnoremap <silent> <leader>c  :<C-u>CocList colors<cr>
" search files
nnoremap <c-p>  :<C-u>CocList files<cr>
" search colors
nnoremap <c-n>  :<C-u>CocList buffers<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't generate a tags file automatically
let g:gutentags_add_default_project_roots = 0
" To enable ctags create a .ctagsenable file in the project root
let g:gutentags_project_root = ['.ctagsenable']
" Pass the paths to exclude to the ctag invocation
if !empty(glob(".ctagsignore"))
	let g:gutentags_ctags_exclude = ['@.ctagsignore']
endif

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
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%F
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=\ 
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set American English as dictionary (for word completion)
set dictionary+=/usr/share/dict/american-english
