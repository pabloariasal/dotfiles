local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    layout_strategy = 'bottom_pane',
    layout_config = {
        bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "bottom",
                preview = false
      },
        vertical = {
            -- prompt_position = 'top',
            height = 25,
      },
    },
    preview = {
      hide_on_startup = true, -- fully disable preview window
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["jj"] = { "<esc>", type = "command" },
        ["<C-h>"] = "which_key"
      },
      n = {
          ["dd"] = actions.delete_buffer
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob",
      "!**/.git/*",
    }
  },
  pickers = {
    find_files = {
      find_command = {"fd", "--type", "f", "--hidden", "-E", ".git"},
      -- theme = "dropdown"
    },
    lsp_document_symbols = {
      symbol_width = 75,
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = "Open Files"})
vim.keymap.set('n', '<c-n>', builtin.buffers, { desc = "Navigate buffers" })
vim.keymap.set('n', '<leader>gl', builtin.live_grep, { desc = "[G]rep [L]ive" })
vim.keymap.set('n', '<leader>o', builtin.oldfiles, { desc = "Open [O]ld files" })
vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
vim.keymap.set('n', '<leader>z', builtin.command_history, { desc = 'open command window' })
vim.keymap.set('n', '<leader>v', '<cmd>Telescope neoclip initial_mode=normal<cr>', { desc = 'open neoclip clipboard' })
-- Lsp
vim.keymap.set('n', '<leader>i', builtin.lsp_document_symbols, { desc = "Navigate [s]ymbols [d]ocument" })
vim.keymap.set('n', '<leader>t', builtin.lsp_dynamic_workspace_symbols, { desc = "Navigate [s]ymbols in workspace" })

require('telescope').load_extension('neoclip')
