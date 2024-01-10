return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "cpp", "rust", "bash", "json", "lua", "toml", "yaml", "python", "haskell", "markdown", "markdown_inline", "html" },
            highlight = {
                enable = true, -- false will disable the whole extension
            },
            indent = {
                enable = true
            },
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
        },
        config = function(_, opts)
            require 'nvim-treesitter.install'.compilers = { "gcc" }
            require 'nvim-treesitter.configs'.setup(opts)
        end,
        init = function()
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    },
    {
        'Wansmer/treesj',
        keys = {
            { "<leader>k", "<cmd>TSJToggle<cr>", desc = "Split/join node under the cursor" },
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = { use_default_keymaps = false },
    }
}
