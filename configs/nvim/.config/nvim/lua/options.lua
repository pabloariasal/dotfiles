vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.swapfile = false
vim.o.showmatch = true
vim.opt.listchars = {
    eol = '¬',
    tab = '» ',
    trail = '~',
    extends = '>',
    precedes = '<',
}
vim.o.list = true
vim.opt.wildignore = { '*/.git/*'}
vim.opt.path = {'.', '**', ','}

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indentation
vim.o.smartindent = true
-- tabs are spaces
vim.o.expandtab = true
-- size of the identation
vim.o.shiftwidth = 4
-- how many spaces are deleted by <bs> or inserted by <tab>
vim.o.softtabstop = 2
-- how many columns is a tab character width?
vim.o.tabstop = 4

-- use ripgrep as grep program
vim.o.grepprg = 'rg -H --no-heading --vimgrep'
vim.o.grepformat = '%f:%l:%c:%m'

-- allow - to be a word character
vim.opt.iskeyword:append { "-" }

-- don't add an eol character at the end of each file
vim.opt.fixendofline = false
