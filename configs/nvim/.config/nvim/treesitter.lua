require'nvim-treesitter.install'.compilers = { "gcc" }
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp","rust","bash","json","lua","toml","yaml","python","haskell", "markdown"},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  }
}
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- join node under cursor
vim.keymap.set('n', '<leader>k', require('treesj').toggle, { noremap=true, desc = 'split/[J]oin node under cursor' })
