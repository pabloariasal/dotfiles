local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    -- path_display = 'smart',
    layout_strategy = 'bottom_pane',
    layout_config = {
        bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "bottom",
                preview = false
        },
    },
    preview = {
      hide_on_startup = true,
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
    }
  },
  pickers = {
    find_files = {
      find_command = {"fd", "--type", "f", "--hidden", "--strip-cwd-prefix", "-E", ".git"},
      -- theme = "dropdown"
    },
    buffers = {
      -- theme = "dropdown"
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
