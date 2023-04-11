-- Diagnostic mappings
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { noremap=true, silent=true, desc="Go to [p]rev [d]iagnostic" })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { noremap=true, silent=true, desc="Go to [n]ext [d]iagnostic" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { noremap=true, silent=true, desc="Open [d]iagnostics" })

local lspconfig = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent=true, noremap=true })
  end

  -- nmap('gD', vim.lsp.buf.declaration, 'Open [D]eclaration')
  nmap('gd', vim.lsp.buf.definition, 'Open [D]efinition')
  nmap('n', 'gI', vim.lsp.buf.implementation, 'Open [I]mplementation')
  nmap('gy', vim.lsp.buf.type_definition, "Open Type Definition")
  nmap('K', vim.lsp.buf.hover, 'Hover')
  nmap('<leader>sh', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
  nmap('<F2>', vim.lsp.buf.rename, "Rename symbol")
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  nmap('<leader>r', vim.lsp.buf.references, "Open [R]eferences")
  nmap('<leader>f', vim.lsp.buf.format, "[F]ormat")
end

-- Haskell - hls
lspconfig.hls.setup {
 settings = {
      languageServerHaskell = {
        formattingProvider = "ormolu";
      }
    },
  on_attach = on_attach,
  capabilities = capabilities
}

-- C++ - ccls
-- lspconfig.ccls.setup {
--   init_options = {
--     cache = {
--       directory = ".ccls-cache"
--     }
--   },
--   -- capabilities = capabilities
--   on_attach = on_attach
-- }

-- C++ clangd
require'lspconfig'.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Python - python-language-server
lspconfig.pylsp.setup{
  cmd = {"pyls"},
  capabilities = capabilities,
  on_attach = on_attach
}

-- CMake - cmake-language-server
lspconfig.cmake.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
