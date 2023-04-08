-- removes trailing white space
vim.api.nvim_create_user_command('ClearWhitespace', '%s/\\s\\+$//', {})
-- close all buffers
vim.api.nvim_create_user_command('BuffCloseAll', 'bufdo bwipeout', {})
-- close all buffers but the current one (similar to tabonly)
vim.api.nvim_create_user_command('BuffOnly', '%bd|e#', {})
