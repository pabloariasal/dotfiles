return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldnestmax = 4
        vim.o.foldenable = true
    end,
    keys = {
        { "zR", function() require('ufo').openAllFolds() end,  desc = "Open all folds" },
        { "zM", function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
        { "K",  function()
                    local winid = require('ufo').peekFoldedLinesUnderCursor()
                    if not winid then
                        vim.lsp.buf.hover()
                    end
                end, desc = "Peek/Hover fold/function" },
    },
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end
    },
    lazy = false
}
