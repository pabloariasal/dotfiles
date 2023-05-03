-- removes trailing white space
vim.api.nvim_create_user_command('ClearWhitespace', '%s/\\s\\+$//', {})
-- close all buffers
vim.api.nvim_create_user_command('BuffCloseAll', 'bufdo bwipeout', {})
-- close all buffers but the current one (similar to tabonly)
vim.api.nvim_create_user_command('BuffOnly', '%bd|e#', {})

-- turn on spell checking in german
vim.api.nvim_create_user_command('SpellCheckGerman', 'set spell spelllang=de_de', {})
-- turn on spell checking in englisch
vim.api.nvim_create_user_command('SpellCheckEnglish', 'set spell spelllang=en_us', {})