"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ - ccls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim_lsp'.ccls.setup{on_attach=require'diagnostic'.on_attach;
    capabilities = {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = false
            }
          }
        }}
    }
EOF
" autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
