require("hardtime").setup{
    disable_mouse = false,
    restricted_keys = {
        ["h"] = { "n", "v" },
        ["j"] = { "n", "v" },
        ["k"] = { "n", "v" },
        ["l"] = { "n", "v" },
        ["-"] = { "n", "v" },
        ["+"] = { "n", "v" },
        ["gj"] = { "n", "v" },
        ["gk"] = { "n", "v" },
        ["<CR>"] = { "n", "v" },
        -- ["<C-M>"] = { "n", "v" },
        ["<C-N>"] = {},
        ["<C-P>"] = {},
    },
    disabled_keys = {
        ["<UP>"] = { "", "i" },
        ["<DOWN>"] = { "", "i" },
        ["<LEFT>"] = { "", "i" },
        ["<RIGHT>"] = { "", "i" }
    },
     disabled_filetypes = { "qf", "netrw", "help" },
}
