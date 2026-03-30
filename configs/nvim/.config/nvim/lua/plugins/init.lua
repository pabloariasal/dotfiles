return {
    -- delete buffers by keeping window layout
    { 'echasnovski/mini.bufremove', version = false, config = true },
    { 'echasnovski/mini.trailspace', version = false, config = true },
    {
        'romainl/vim-qf',
        init = function()
            vim.g.qf_max_height = 20
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
    -- automatically toggle between relative and absolute line numbers
    'sitiom/nvim-numbertoggle',
    -- text object 'ae' as entire buffer
    {
        'kana/vim-textobj-entire',
        dependencies = { 'kana/vim-textobj-user' }
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    'sindrets/diffview.nvim',
}
