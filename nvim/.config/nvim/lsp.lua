-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, opts)

local lspconfig = require'lspconfig'

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>v', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Haskell - hls
lspconfig.hls.setup {
 settings = {
      languageServerHaskell = {
        formattingProvider = "ormolu";
      }
    },
  on_attach = on_attach
  -- capabilities = capabilities
}

-- C++ - ccls
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache"
    }
  },
  -- capabilities = capabilities
  on_attach = on_attach
}

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{
  -- capabilities = capabilities
  on_attach = on_attach
}

-- Python - python-language-server
lspconfig.pylsp.setup{
  -- capabilities = capabilities
  on_attach = on_attach
}
