"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell - hls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local lspconfig = require'lspconfig'

-- Haskell - hls
lspconfig.hls.setup {
 settings = {
      languageServerHaskell = {
        formattingProvider = "ormolu";
      };
    };
}

-- C++ - ccls
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}
EOF
