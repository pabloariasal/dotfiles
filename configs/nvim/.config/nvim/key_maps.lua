-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('n', "\\", ',', { noremap=true })
vim.keymap.set({'n', 'v'}, ',', ':', { noremap=true })
vim.keymap.set('i', 'jj', '<ESC>', { noremap=true })
-- indent visual block
vim.keymap.set('v', '<', '<gv', { desc = 'Indent visual block right' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent visual block left' })
vim.keymap.set('n', '<leader>a', require('alternate').alternate, { desc = 'alternate between header and cpp' })
vim.keymap.set('n', '<leader>c', "<cmd>bp <bar> bd #<cr>", {})
vim.keymap.set('n', '<leader>e', '<cmd>EditVifm<cr>', {})
-- -- grep
vim.keymap.set('n', '<leader>gn', ':<c-u>grep! ', { desc = 'grep for word' })
vim.keymap.set('n', '<leader>gc', ':<c-u>grep! <C-r>=expand("<cword>")<cr>', { desc = 'grep for word under cursor' })
vim.keymap.set('n', '<leader>t', ':<c-u>tjump ', { desc = 'start tjump prompt' })
-- -- quitting and saving
vim.keymap.set('n', '<leader>w', '<cmd>wa<cr>', { desc = 'save all' })
vim.keymap.set('n', '<leader>q', '<cmd>xa<cr>', { desc = 'quit' })
vim.keymap.set('n', '<c-q>', '<cmd>xa!<cr>', { desc = 'force quit all' })
-- -- splits
vim.keymap.set('n', '<c-left>', '<cmd>vertical resize +3<cr>', { desc = 'resize split to the left' })
vim.keymap.set('n', '<c-right>', '<cmd>vertical resize -3<cr>', { desc = 'resize split to the right' })
vim.keymap.set('n', '<c-up>', '<cmd>resize +3<cr>', { desc = 'resize split to the top' })
vim.keymap.set('n', '<c-down>', '<cmd>resize -3<cr>', { desc = 'resize split to the bottom' })

vim.keymap.set('n', '<c-j>', '<c-w>j', { desc = 'move to split left' })
vim.keymap.set('n', '<c-k>', '<c-w>k', { desc = 'move to split right' })
vim.keymap.set('n', '<c-h>', '<c-w>h', { desc = 'move to split top' })
vim.keymap.set('n', '<c-l>', '<c-w>l', { desc = 'move to split bottom' })

vim.keymap.set('n', 'gq', '<Plug>(qf_qf_toggle)', { desc = 'toggle quickfix list' })
vim.keymap.set('n', 'gl', '<Plug>(qf_loc_toggle)', { desc = 'toggle location list' })

vim.keymap.set({'n', 'v'}, 'z*', '*N', { desc = 'search for word under cursor' })
vim.keymap.set({'n', 'v'}, 'z#', '#N', { desc = 'search backward for word under cursor' })

vim.keymap.set('n', '<F1>', '<cmd>source ~/.config/nvim/init.vim<cr>', { desc = 'reload config' })
