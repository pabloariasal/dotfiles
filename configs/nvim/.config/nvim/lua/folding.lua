vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.wo.foldnestmax = 4
vim.o.foldlevelstart = 1
vim.wo.foldenable = false
