local lspconfig = require'lspconfig'

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
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
