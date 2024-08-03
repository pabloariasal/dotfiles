-- turn on spell checking on markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "setlocal spell spelllang=en_us",
})

-- open help in a right vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

-- automatically close preview window on finishing complete
vim.api.nvim_create_autocmd("CompleteDone", {
    pattern = "*",
    command = "pclose",
})

-- disable numbers in terminal windows
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

-- when opening a file jump to the latest position
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  pattern = '*',
  command = 'silent! normal! g`"zv'
})
