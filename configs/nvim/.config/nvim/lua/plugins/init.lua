return {
    'neovim/nvim-lspconfig',
    'tpope/vim-repeat',
    'tpope/vim-sleuth',
    'tpope/vim-eunuch',
    'tpope/vim-unimpaired',
    {
        'romainl/vim-qf',
        init = function()
            vim.g.qf_max_height = 20
        end
    },
    {
        'vifm/vifm.vim',
        init = function()
            vim.g.netrw_banner = 0
            vim.g.netrw_liststyle = 3
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.g.vifm_replace_netrw = 1
            vim.g.vifm_exec_args = '-c :only'
        end,
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
        'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle, desc = "Toggle undo tree" }
        }
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function() require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
}
