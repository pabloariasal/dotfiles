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
let g:gutentags_file_list_command = 'rg --files'

