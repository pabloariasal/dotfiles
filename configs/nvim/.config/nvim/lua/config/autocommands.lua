vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "setlocal spell spelllang=en_us",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

vim.api.nvim_create_autocmd("CompleteDone", {
    pattern = "*",
    command = "pclose",
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})
