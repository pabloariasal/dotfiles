-- gruvbox
vim.g.gruvbox_sign_column = 'bg0'
vim.g.gruvbox_italic = true

-- oceanic next
vim.g.oceanic_next_terminal_bold = true
vim.g.oceanic_next_terminal_italic = true

-- seoul256
vim.g.seoul256_background = 236

vim.o.termguicolors = true

function read_file(file_path)
    local file = io.open(file_path, 'r')
    local contents = file:read()
    file:close()
    return contents
end

local home = os.getenv("HOME")

local b = read_file(home .. "/.nvim_background.txt", "r")
if not b then
    vim.o.background = 'dark'
else
    vim.o.background = b
end

local c = read_file(home .. "/.nvim_colorscheme.txt", "r")
if not c then
    vim.cmd('colorscheme ' .. 'gruvbox')
else
    vim.cmd('colorscheme ' .. c)
end
