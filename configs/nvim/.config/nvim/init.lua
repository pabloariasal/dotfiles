-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

vim.cmd([[
    "Load plugins per filetype
    filetype plugin on
    filetype plugin indent on

    "Enable syntax highlighting
    syntax on
]])
require("config.options")
require("config.autocommands")
require("config.key_maps")
require("config.statusline")
require("config.lsp")
require("config.completion")
require("config.colors")
require("config.user-commands")
require("config.folding")
require("config.snippets")
