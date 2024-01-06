local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ja", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>jm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>jj", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>jk", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>jl", function() harpoon:list():select(3) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>jp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>jn", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>jc", function() harpoon:list():clear() end)
