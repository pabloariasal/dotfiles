-- Configuration for generating a tag file 
-- expects universal ctags to be installed

-- Don't generate a tags file automatically
vim.g.gutentags_add_default_project_roots = 0

-- To enable ctags create a .ctagsenable file in the project root
-- run 'toggle_ctags' for this
vim.g.gutentags_project_root = {'.ctagsenable'}

--ctagsenable is a script that list the relevant files to index
vim.g.gutentags_file_list_command = 'bash .ctagsenable'
vim.g.gutentags_ctags_extra_args = {'--tag-relative=always'}
