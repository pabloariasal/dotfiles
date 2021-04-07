"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell - hls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local lspconfig = require'lspconfig'
lspconfig.hls.setup{}
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}
EOF
