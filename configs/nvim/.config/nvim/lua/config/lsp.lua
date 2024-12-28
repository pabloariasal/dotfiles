vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)

    local nmap = function(keys, func, desc, mode)
      if desc then
        desc = 'LSP: ' .. desc
      end
      if mode == nil then
        mode = 'n'
      end

      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = desc, silent=true, noremap=true })
    end
    nmap('gD', vim.lsp.buf.declaration, 'Open [D]eclaration')
    nmap('gd', vim.lsp.buf.definition, 'Open [D]efinition')
    nmap('gI', vim.lsp.buf.implementation, 'Open [I]mplementation')
    nmap('gy', vim.lsp.buf.type_definition, "Open Type Definition")
    nmap('<F2>', vim.lsp.buf.rename, "Rename symbol")
    nmap('<leader>m', vim.lsp.buf.code_action, "Code Action", {'n', 'v'})
    nmap('<leader>r', vim.lsp.buf.references, "Open [R]eferences")
    nmap('<c-h>', vim.lsp.buf.signature_help, "Signature help", 'i')

  -- Unset 'formatexpr', as this is handled by conform.nvim
    vim.bo[ev.buf].formatexpr = nil
  end,
})

local lspconfig = require'lspconfig'

-- Haskell - hls
lspconfig.hls.setup {
  haskell = {
    formattingProvider = "ormolu",
  }
}

-- C++ clangd
lspconfig.clangd.setup{}

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{}

-- Python - python-language-server
lspconfig.pylsp.setup{
  cmd = {"pylsp"},
  settings = {
    pylsp = {
      plugins = {
        pylint  = {
          enabled = true
        }
      }
    }
  }
}

-- CMake - cmake-language-server
lspconfig.cmake.setup{}

-- Lua
lspconfig.lua_ls.setup{}
