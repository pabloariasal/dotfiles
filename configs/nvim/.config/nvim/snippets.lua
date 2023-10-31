-- setup snippet support with nvim-snippy
local status_ok, snippy = pcall(require, "snippy")
if not status_ok then
  return
end

snippy.setup {
    scopes = {
        cpp = {'_', 'cpp', 'gtest'},
        sh = {'bash', 'zsh'}
   }
}

local map = vim.keymap.set

map( { 'i', 's' }, '<c-space>', function() return require('snippy').can_expand() and '<plug>(snippy-expand)' or '<tab>' end, { expr = true } )
map( { 'i', 's' }, '<c-k>', function() return require('snippy').can_jump(-1) and '<plug>(snippy-previous)' or '<c-k>' end, { expr = true } )
map( { 'i', 's' }, '<c-j>', function() return require('snippy').can_jump(1) and '<plug>(snippy-next)' or '<c-j>' end, { expr = true } )
map('x', '<c-space>', '<plug>(snippy-cut-text)')
map('n', 'g<c-space>', '<plug>(snippy-cut-text)')
