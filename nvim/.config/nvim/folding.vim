"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"
" Required Plugins: masukomi/vim-markdown-folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"Don't nest more than 3 folds
set foldnestmax=2
"Open folds per default
set foldenable
"When enabled, fold at top-level
set foldlevel=1

"if on markdown, use special fold syntax
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

" don't fold python docstrings or imports
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0
