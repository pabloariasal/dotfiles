"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"
" Required Plugins: completion-nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'},
    \{'mode': 'dict'},
\]
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
