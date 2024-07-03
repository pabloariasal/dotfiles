return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('harpoon'):setup()
    end,
    keys = {
        { "<leader>ja", function() require('harpoon'):list():add() end,                      desc = "Harpoon: add " },
        { "<leader>jm", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Harpoon: toggle menu " },
        { "<leader>jj", function() require('harpoon'):list():select(1) end,                     desc = "Harpoon: select 1" },
        { "<leader>jk", function() require('harpoon'):list():select(2) end,                     desc = "Harpoon: select 2" },
        { "<leader>jl", function() require('harpoon'):list():select(3) end,                     desc = "Harpoon: select 3" },
        { "<leader>jp", function() require('harpoon'):list():prev() end,                        desc = "Harpoon: previous" },
        { "<leader>jn", function() require('harpoon'):list():next() end,                        desc = "Harpoon: next" },
        { "<leader>jc", function() require('harpoon'):list():clear() end,                       desc = "Harpoon: clear" },
    }
}
