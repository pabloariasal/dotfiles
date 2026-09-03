return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
        vim.g.no_plugin_maps = true

        -- Or, disable per filetype (add as you like)
        -- vim.g.no_python_maps = true
        -- vim.g.no_ruby_maps = true
        -- vim.g.no_rust_maps = true
        -- vim.g.no_go_maps = true
    end,
    opts = {
        select = {
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ["@parameter.outer"] = "v", -- charwise
                ["@function.outer"] = "V", -- linewise
                -- ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
        },
    },
    config = function()
        -- put your config here
    end,
    keys = {
        {
            "af",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
            end,
            mode = { "x", "o" },
        },
        {
            "if",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
            end,
            mode = { "x", "o" },
        },
        {
            "ac",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
            end,
            mode = { "x", "o" },
        },
        {
            "ic",
            function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
            end,
            mode = { "x", "o" },
        },
        {
            "<leader>sp",
            function()
                require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
            end
        },
        {
            "<leader>sn",
            function()
                require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
            end
        },

    },
}
