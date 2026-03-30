-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Plugins
require("lazy_plugin")

-- Config
require("options")
require("autocommands")
require("key_maps")
require("statusline")
require("lsp")
require("completion")
require("colors")
require("user-commands")
require("folding")
require("snippets")
