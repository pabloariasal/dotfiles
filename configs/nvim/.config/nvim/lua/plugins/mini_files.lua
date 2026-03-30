return {
    "echasnovski/mini.files",
    version = false,
    config = function()
        require("mini.files").setup({
            mappings = {
                go_in = "<CR>",
                go_in_plus = "l",
            },
        })
    end,
}
