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

"system clipboard
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y

"best mappings ever
noremap <Space> :
inoremap jj <ESC>

"remove trailing whitespace
nmap <silent> <leader>n :<C-u>%s/\s\+$//<cr>

"save all buffers
nmap <Leader>w :<C-u>wa<cr>
"quit and save
nmap <leader>e :<C-u>wq<cr>
"quit and save
nmap <leader>q :<C-u>q<cr>
"force quit without saving
nmap <leader><leader>q :<C-u>qa!<cr>

" grep for word under the cursor
nnoremap <Leader>g :<C-u>grep 
nnoremap <Leader>r :<C-u>grep '<C-r>=expand("<cword>")<CR>'<CR>

" Indent visual block
vmap < <gv
vmap > >gv

"jump to alternate file
nmap <silent> <leader>a :<C-u>Alternate<CR>

" Split resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Delete buffers
nnoremap <silent> <leader>b <cmd>Bdelete menu<CR>
nnoremap <silent> <leader>c <cmd>bp <bar>bd #<cr>

" Don't write { } motions to the jump list
nnoremap <silent> } <cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { <cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>

"Reload vimrc
nnoremap <F1> <cmd>source ~/.config/nvim/init.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate by fold
nnoremap <silent> <c-j> <cmd>execute "keepjumps norm! " . v:count1 . "zj"<CR>
nnoremap <silent> <c-k> <cmd>execute "keepjumps norm! " . v:count1 . "zk"<CR>

" Open fold under the cursor
nnoremap <silent> <cr> za
" Visual feedback when changing fold level
nnoremap zm zm<cmd>echo "foldlevel" &foldlevel<cr>
nnoremap zr zr<cmd>echo "foldlevel" &foldlevel<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list and Location List
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[vim-qf] Toggle quickfix list
nmap <C-q> <Plug>(qf_qf_switch)
nmap gq <Plug>(qf_qf_toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol
"
" Required Plugins: coc.nvim with coc-lists extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
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

" Format current buffer
nmap <leader>f <Plug>(coc-format)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: coc.nvim with coc-lists extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <c-p>  <cmd>Files<cr>
nnoremap <silent> <c-n>  <cmd>Buffers<cr>
nnoremap <silent> <c-l>  <cmd>Tags<cr>
nnoremap <silent> <c-h>  <cmd>BTags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Floating Terminal
"
" Required Plugins: coc.nvim with coc-lists extension
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_kill   = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'
nnoremap <silent> <leader>v :Vifm<CR>
tnoremap <silent> <leader>v <C-\><C-n>:Vifm<CR>
