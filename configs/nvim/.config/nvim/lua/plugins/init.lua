return {
    'neovim/nvim-lspconfig',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tpope/vim-sleuth',
    'tpope/vim-eunuch',
    'tpope/vim-unimpaired',
    'tpope/vim-commentary',
    'vim-scripts/ReplaceWithRegister',
    {
        'romainl/vim-qf',
        init = function()
            vim.g.qf_max_height = 20
        end
    },
    {
        'stevearc/oil.nvim',
        keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "Open parent directory" } },
        config = function()
            require('oil').setup()
        end
    },
    {
        'markonm/traces.vim',
        init = function()
            vim.g.traces_num_range_preview = 1
        end
    },
    {
        'szw/vim-maximizer',
        keys = {
            { '<leader>l', '<cmd>MaximizerToggle<cr>', desc = 'maximize current window' }
        },
    },
    {
        'pabloariasal/alternate.nvim',
        keys = {
            { '<leader>a', function() require('alternate').alternate() end, desc = 'alternate between header and cpp' }
        }
    },
    'pabloariasal/webify.nvim',
    'sitiom/nvim-numbertoggle',
    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
        }
    },
    {
        'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle, desc = "Toggle undo tree" }
        }
    }
}
