return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
        vim.o.foldlevelstart = 99
        vim.o.foldnestmax = 4
    end,
    keys = {
        { "zR", function() require('ufo').openAllFolds() end,  desc = "Open all folds" },
        { "zM", function() require('ufo').closeAllFolds() end, desc = "Open all folds" },
    },
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end
    },
    lazy = false
}
