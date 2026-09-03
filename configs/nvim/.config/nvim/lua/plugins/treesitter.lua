-- https://github.com/datwaft/nvim.conf/blob/main/lua/packages/treesitter.lua#L12-L29
-- https://codeberg.org/dannyfritz/dotfiles/src/commit/fd3623617c4462a98d56608e18e9bcbe2beda562/mini/lua/utils/treesitter_enable.lua

local function treesitter_enable(filetype)
    local WAIT_TIME = 1000 * 30 -- 30 seconds
    require("nvim-treesitter").install(filetype):wait(WAIT_TIME)
    local lang = vim.treesitter.language.get_lang(filetype)
    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
        desc = "Enable Treesitter features for " .. lang,
        pattern = vim.treesitter.language.get_filetypes(lang),
        callback = function()
            if vim.treesitter.query.get(lang, "highlights") then
                vim.treesitter.start()
            end
            if vim.treesitter.query.get(lang, "indents") then
                vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
            end
            if vim.treesitter.query.get(lang, "folds") then
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            end
        end,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = 'main',
    build = ":TSUpdate",
    init = function()
        treesitter_enable('python')
        treesitter_enable('lua')
        treesitter_enable('cpp')
        treesitter_enable('bash')
        treesitter_enable('json')
        treesitter_enable('yaml')
        treesitter_enable('markdown')
        treesitter_enable('markdown_inline')
        treesitter_enable('toml')
    end,
}
