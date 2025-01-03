return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = function()
            local actions = require("telescope.actions")
            return {
                defaults = {
                    layout_strategy = 'bottom_pane',
                    layout_config = {
                        bottom_pane = {
                            height = 25,
                            preview_cutoff = 120,
                            prompt_position = "bottom",
                            preview = false
                        },
                        vertical = {
                            -- prompt_position = 'top',
                            height = 25,
                        },
                    },
                    preview = {
                        hide_on_startup = true, -- fully disable preview window
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<esc>"] = actions.close,
                            ["jj"] = { "<esc>", type = "command" },
                        },
                        n = {
                            ["dd"] = actions.delete_buffer
                        }
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob",
                        "!**/.git/*",
                    }
                },
                pickers = {
                    find_files = {
                        find_command = { "fd", "--type", "f", "--hidden", "-E", ".git" },
                        -- theme = "dropdown"
                    },
                    lsp_document_symbols = {
                        symbol_width = 75,
                    },
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                }
            }
        end,
        keys = {
            { '<c-p>',            function() require('telescope.builtin').find_files() end,                    desc = "Open Files" },
            { '<c-n>',            function() require('telescope.builtin').buffers() end,                       desc = "Navigate buffers" },
            { '<leader>gl',       function() require('telescope.builtin').live_grep() end,                     desc = "[G]rep [L]ive" },
            { '<leader>o',        function() require('telescope.builtin').oldfiles() end,                      desc = "Open [O]ld files" },
            { '<leader><leader>', function() require('telescope.builtin').current_buffer_fuzzy_find() end,     desc = "Search in current buffer" },
            { '<leader>v',        function() require('telescope').extensions.neoclip.default() end,            desc = "Open neoclip clipboard" },
            { '<leader>sd',        function() require('telescope.builtin').lsp_document_symbols() end,          desc = "Navigate [s]ymbols [d]ocument" },
            { '<leader>sw',        function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, desc = "Navigate [s]ymbols in [w]orkspace" },
        }
    },
    {
        "AckslD/nvim-neoclip.lua",
        name = 'neoclip',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        opts = {
            keys = {
                telescope = {
                    i = {
                        select = '<c-l>',
                        paste = '<cr>',
                        paste_behind = '<c-h>',
                    },
                }
            }
        },
        config = function(_, opts)
            require('neoclip').setup(opts)
        end
    }
}
