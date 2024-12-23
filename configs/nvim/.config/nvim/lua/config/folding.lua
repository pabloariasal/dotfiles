vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.wo.foldenable = true
vim.wo.foldnestmax = 4
vim.o.foldlevelstart = 1
