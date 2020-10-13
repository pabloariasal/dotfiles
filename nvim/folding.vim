"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"
" Required Plugins: masukomi/vim-markdown-folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Per default fold on syntax (C/C++)
set foldmethod=syntax
"Don't nest more than 3 folds
set foldnestmax=2
"Open folds per default
set foldenable
"When enabled, fold at top-level
set foldlevel=1
"if on markdown, use special fold syntax
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()
