return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            json = { "jq" },
            lua = { "stylua" },
            python = { "yapf" }
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            desc = "[Format] document",
        },
    },
    lazy = false,
}
