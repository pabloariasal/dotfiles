local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

vim.opt.shortmess:append "c"
vim.opt.completeopt = {"menuone", "noinsert", "noselect" }

cmp.setup {
    snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body) -- For `snippy` users.
          end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
         ['<C-f>'] = cmp.mapping.scroll_docs(4),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<C-e>'] = cmp.mapping.abort(),
         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
       }),
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
      { name = 'path' },
      { name = 'spell' },
      { name = 'buffer-lines' },
    }
}
