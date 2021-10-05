"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"
" Required Plugins: masukomi/vim-markdown-folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"Enable folding per default
set foldenable

"Taken from https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set fillchars=fold:\\
set foldnestmax=3
set foldminlines=1

"if on markdown, use special fold syntax
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()
