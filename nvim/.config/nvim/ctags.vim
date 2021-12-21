"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
"
" Required Plugins: ludovicchabant/vim-gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Don't generate a tags file automatically
let g:gutentags_add_default_project_roots = 0
"To enable ctags create a .ctagsenable file in the project root
let g:gutentags_project_root = ['.ctagsenable']
"ctagsenable is a script that list the relevant files to index
let g:gutentags_file_list_command = 'bash .ctagsenable'
let g:gutentags_ctags_extra_args = ['--tag-relative=always']
