local lspconfig = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Haskell - hls
lspconfig.hls.setup {
 settings = {
      languageServerHaskell = {
        formattingProvider = "ormolu";
      }
    },
  capabilities = capabilities
}

-- C++ - ccls
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache"
    }
  },
  capabilities = capabilities
}

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{
  capabilities = capabilities
}

-- Python - python-language-server
lspconfig.pylsp.setup{
  capabilities = capabilities
}
