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

-- Rust - rust-analyzer
lspconfig.rust_analyzer.setup{}

-- Python - python-language-server
require'lspconfig'.pyls.setup{
 settings = {
      pyls = {
      };
    };
}
EOF
