"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"
" Required Plugins: completion-nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" let g:completion_auto_change_source = 1
" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp']},
"     \{'complete_items': ['path']},
"     \{'mode': '<c-p>'},
"     \{'mode': '<c-n>'},
"     \{'mode': 'dict'},
" \]
" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
