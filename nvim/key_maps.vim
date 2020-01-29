"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
" | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
" | | ____   ____  | || |     _____    | || | ____    ____ | || |  _______     | || |     ______   | |
" | ||_  _| |_  _| | || |    |_   _|   | || ||_   \  /   _|| || | |_   __ \    | || |   .' ___  |  | |
" | |  \ \   / /   | || |      | |     | || |  |   \/   |  | || |   | |__) |   | || |  / .'   \_|  | |
" | |   \ \ / /    | || |      | |     | || |  | |\  /| |  | || |   |  __ /    | || |  | |         | |
" | |    \ ' /     | || |     _| |_    | || | _| |_\/_| |_ | || |  _| |  \ \_  | || |  \ `.___.'\  | |
" | |     \_/      | || |    |_____|   | || ||_____||_____|| || | |____| |___| | || |   `._____.'  | |
" | |              | || |              | || |              | || |              | || |              | |
" | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
"  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
"
" Maintainer:
"   Pablo Arias - pabloariasal@gmail.com
"
" Description:
"   Key Mappings
"
" Required Plugins: vim-qf, coc.nvim with coc-lists extension
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

"but don't lose reverse motion
noremap \ ,

"make Y consistent with other motions
map Y y$

"convenient window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"system clipboard
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y

"use space to toggle folds in normal mode
nnoremap <Space> za
vnoremap <Space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list and Location List
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[vim-qf] Toggle location and quickfix lists
nmap <Leader>q <Plug>(qf_qf_toggle)
nmap <Leader>l <Plug>(qf_loc_toggle)

"[vim-qf] Focus quickfixlist
nmap gq <Plug>(qf_qf_switch)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol
"
" Required Plugins: coc.nvim with coc-lists extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gk <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

nnoremap <silent> <leader>d  :<C-u>CocList --normal diagnostics<cr>
"Symbols in current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
"Symbols in workspace
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>t  :<C-u>CocList tags<cr>

nmap <leader>f <Plug>(coc-format)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: coc.nvim with coc-lists extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>c  :<C-u>CocList colors<cr>
nnoremap <c-p>  :<C-u>CocList files<cr>
nnoremap <c-n>  :<C-u>CocList buffers<cr>
nnoremap <Leader>g :<C-u>CocList -I grep<cr>
nnoremap <silent> <Leader>r :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buiding
"
" Required Plugins: neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>mf :<C-u>Neomake! make_build_filtered<cr>
nnoremap <Leader>mr :<C-u>Neomake! make_build<cr>
