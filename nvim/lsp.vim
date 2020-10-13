"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++ - ccls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lua <<EOF
" require'nvim_lsp'.ccls.setup{on_attach=require'diagnostic'.on_attach;
"     capabilities = {
"         textDocument = {
"           completion = {
"             completionItem = {
"               snippetSupport = false
"             }
"           }
"         }}
"     }
" EOF
" autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
endfunction
let g:lsp_highlight_references_enabled = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '⚠'}
let g:lsp_signs_information = {'text': '✗'}
let g:lsp_signs_hint = {'text': '✗'}
