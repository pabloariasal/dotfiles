lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp","rust","bash","markdown"},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
