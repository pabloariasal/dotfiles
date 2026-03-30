return {
    "pabloariasal/alternate.nvim",
    keys = {
        {
            "<leader>a",
            function()
                require("alternate").alternate()
            end,
            desc = "alternate between header and cpp",
        },
    },
}
