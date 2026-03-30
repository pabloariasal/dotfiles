local cpp_patterns = { 'cpp.json', 'gtest.json' }
local html_patterns = { 'html.json', 'reveal.json' }

local lang_patterns = { html = html_patterns, cpp = cpp_patterns }
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
    snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        gen_loader.from_file('~/.config/nvim/snippets/global.json'),

        -- Load snippets based on current language by reading files from
        -- "snippets/" subdirectories from 'runtimepath' directories.
        gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
    mappings = {
        -- Expand snippet at cursor position. Created globally in Insert mode.
        expand = '<c-space>',

        -- Interact with default `expand.insert` session.
        -- Created for the duration of active session(s)
        jump_next = '<c-l>',
        jump_prev = '<c-h>',
        stop = '<c-c>',
    },
})
