-- Global mappings
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { noremap=true, silent=true, desc="Go to [p]rev [d]iagnostic" })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { noremap=true, silent=true, desc="Go to [n]ext [d]iagnostic" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { noremap=true, silent=true, desc="Open [d]iagnostics" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc, silent=true, noremap=true })
    end
    nmap('gD', vim.lsp.buf.declaration, 'Open [D]eclaration')
    nmap('gd', vim.lsp.buf.definition, 'Open [D]efinition')
    nmap('K', vim.lsp.buf.hover, 'Hover')
    nmap('gI', vim.lsp.buf.implementation, 'Open [I]mplementation')
    nmap('gy', vim.lsp.buf.type_definition, "Open Type Definition")
    nmap('<leader>sh', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
    nmap('<F2>', vim.lsp.buf.rename, "Rename symbol")
    -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    nmap('<leader>r', vim.lsp.buf.references, "Open [R]eferences")
    nmap('<leader>f', vim.lsp.buf.format, "[F]ormat")
  end,
})

local lspconfig = require'lspconfig'

-- Haskell - hls
lspconfig.hls.setup {
 settings = {
      languageServerHaskell = {
        formattingProvider = "ormolu";
      }
    },
}

-- C++ clangd
lspconfig.clangd.setup{}

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{}

-- Python - python-language-server
lspconfig.pylsp.setup{
  cmd = {"pylsp"},
}

-- CMake - cmake-language-server
lspconfig.cmake.setup{}
