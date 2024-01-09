require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      -- lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      include_surrounding_whitespace = true,
    },
    swap = {
          enable = true,
          swap_next = {
            ["<leader>b"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>B"] = "@parameter.inner",
          },
        },
  },
}
