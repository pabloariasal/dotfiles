-- reverse motion with backslash
vim.keymap.set('n', "\\", ',', { noremap=true })
-- open command line prompt with ,
vim.keymap.set({'n', 'v'}, ',', ':', { noremap=true })
-- move to begining and end of the line
vim.keymap.set({'n', 'v'}, '<a-l>', '$', { noremap=true })
vim.keymap.set({'n', 'v'}, '<a-h>', '^', { noremap=true })
-- quitting and saving
vim.keymap.set({'n'}, '<leader>w', '<cmd>wa<cr>', { noremap=true })
vim.keymap.set({'n'}, '<leader>q', '<cmd>q<cr>', { noremap=true })
vim.keymap.set({'n'}, '<c-q>', '<cmd>qa!<cr>', { noremap=true })
-- exit insert mode with jj (best mapping ever)
vim.keymap.set('i', 'jj', '<ESC>', { noremap=true })
-- indent visual block
vim.keymap.set('v', '<', '<gv', { desc = 'Indent visual block right' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent visual block left' })
-- close buffer
vim.keymap.set('n', '<leader>c', "<cmd>bp <bar> bd #<cr>", { desc = 'close the current buffer' })
-- file explorer
vim.keymap.set('n', '<leader>e', '<cmd>EditVifm<cr>', { desc = 'open file explorer' })
-- grepping
vim.keymap.set('n', '<leader>gn', ':<c-u>grep! ', { desc = 'grep for word' })
vim.keymap.set('n', '<leader>gc', ':<c-u>grep! <C-r>=expand("<cword>")<cr>', { desc = 'grep for word under cursor' })
-- resize splits
vim.keymap.set('n', '<c-left>', '<cmd>vertical resize +3<cr>', { desc = 'resize split to the left' })
vim.keymap.set('n', '<c-right>', '<cmd>vertical resize -3<cr>', { desc = 'resize split to the right' })
vim.keymap.set('n', '<c-up>', '<cmd>resize +3<cr>', { desc = 'resize split to the top' })
vim.keymap.set('n', '<c-down>', '<cmd>resize -3<cr>', { desc = 'resize split to the bottom' })
-- move to split
vim.keymap.set('n', '<c-j>', '<c-w>j', { desc = 'move to split left' })
vim.keymap.set('n', '<c-k>', '<c-w>k', { desc = 'move to split right' })
vim.keymap.set('n', '<c-h>', '<c-w>h', { desc = 'move to split top' })
vim.keymap.set('n', '<c-l>', '<c-w>l', { desc = 'move to split bottom' })
-- toggle quickfix and location lists
vim.keymap.set('n', '<leader>sq', '<Plug>(qf_qf_toggle)', { desc = 'toggle quickfix list' })
vim.keymap.set('n', '<leader>sl', '<Plug>(qf_loc_toggle)', { desc = 'toggle location list' })
-- search word under cursor without jumping
vim.keymap.set({'n', 'v'}, 'z*', '*N', { desc = 'search for word under cursor no jump' })
vim.keymap.set({'n', 'v'}, 'z#', '#N', { desc = 'search backward for word under cursor no jump' })
-- reload config
vim.keymap.set('n', '<F1>', '<cmd>source ~/.config/nvim/init.lua<cr>', { desc = 'reload config' })
-- system clipboard
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap=true, desc = 'paste from system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', { noremap=true, desc = 'paste from system clipboard' })
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', { noremap=true, desc = 'yank to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+y$', { noremap=true, desc = 'yank to system clipboard' })
-- webify.nvim
vim.keymap.set('n', '<leader>x', '<cmd>YankFileUrl +<cr>', { desc = 'Yank Url to system clipboard'})
vim.keymap.set('n', '<leader>X', '<cmd>YankLineUrl +<cr>', { desc = 'Yank Url to system clipboard, including current line'})
