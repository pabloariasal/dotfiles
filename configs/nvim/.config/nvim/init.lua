-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd('runtime general.vim')
require("config.options")
require("config.autocommands")
require("config.key_maps")
require("config.statusline")
require("config.lsp")
require("config.completion")
require("config.colors")
require("config.user-commands")
