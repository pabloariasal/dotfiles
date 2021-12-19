require'nvim-treesitter.install'.compilers = { "gcc" }
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c","cpp","rust","bash","json","lua","toml","yaml","python", "haskell"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {}
  },
  indent = {
    enable = true
  }
}
