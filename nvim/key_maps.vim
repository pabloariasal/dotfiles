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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

"but don't lose reverse motion
noremap \ ,

"make Y consistent with other motions
nnoremap Y y$

"system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y
xnoremap <leader>p "+p

"best mapping ever
inoremap jj <ESC>

"quit and save
nmap <leader>w <cmd>wa<cr>
nmap <leader>e <cmd>wq<cr>
nmap <leader>q <cmd>q<cr>

" grep for word under the cursor
nnoremap <Leader>r :<C-u>grep '<C-r>=expand("<cword>")<CR>'<CR>

" Indent visual block
vmap < <gv
vmap > >gv

"jump to alternate file
nmap <silent> <leader>a <cmd>Alternate<CR>

" Delete buffers
nnoremap <silent> <leader>b <cmd>Bdelete menu<CR>
nnoremap <silent> <leader>c <cmd>bp <bar>bd #<cr>

" Don't write { } motions to the jump list
nnoremap <silent> } <cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { <cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>

"Reload vimrc
nnoremap <F12> <cmd>source ~/.config/nvim/init.vim<cr>

"Swap arguments
nnoremap g< <cmd>SidewaysLeft<cr>
nnoremap g> <cmd>SidewaysRight<cr>

"switch to alternate buffer
nnoremap <BS> <C-^>

nnoremap <a-h> ^
nnoremap <a-l> $

nnoremap <silent> <c-j> }
nnoremap <silent> <c-k> {

"open command prompt
nnoremap , :

nnoremap <leader>u <cmd>ClearWhitespace<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" resize
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <a-j> gt
nnoremap <silent> <a-k> gT

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate by fold
autocmd FileType rust,cpp,python,markdown
            \ nnoremap <buffer> <silent> <c-j> <cmd>execute "keepjumps norm! " . v:count1 . "zj"<CR>
autocmd FileType rust,cpp,python,markdown
            \ nnoremap <buffer> <silent> <c-k> <cmd>execute "keepjumps norm! " . v:count1 . "zk"<CR>

" Open fold under the cursor
nnoremap <silent> <c-l> za

" Visual feedback when changing fold level
nnoremap zm zm<cmd>echo "foldlevel" &foldlevel<cr>
nnoremap zr zr<cmd>echo "foldlevel" &foldlevel<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list and Location List
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-q> <Plug>(qf_qf_switch)
nmap gq <Plug>(qf_qf_toggle)
nmap gl <Plug>(qf_loc_toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol
"
" Required Plugins: coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gk <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
" nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<Cr>
" nnoremap <silent> [g <cmd>PrevDiagnosticCycle<CR>
" nnoremap <silent> ]g <cmd>NextDiagnosticCycle<CR>

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap K <cmd>call CocAction("doHover")<CR>
nmap gk <Plug>(coc-references-used)
nmap <leader>f <cmd>Format<CR>
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
nmap <F1> <cmd>CocDiagnostics<CR>
nmap <F2> <Plug>(coc-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: fzf-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <c-p>  <cmd>Files<cr>
nnoremap <silent> <c-n>  <cmd>Buffers<cr>
nnoremap <silent> <leader>t  <cmd>Tags<cr>
nnoremap <silent> <leader>o  <cmd>BTags<cr>
nnoremap <silent> <leader>g <cmd>Rg<cr>
nnoremap <silent> <leader>j <cmd>BLines<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Star
"
" Required Plugins: vim-asterisk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
" search but don't add work separators
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
" search but don't jump
map z*  <Plug>(asterisk-z*)
map z#  <Plug>(asterisk-z#)
map gz* <Plug>(asterisk-gz*)
map gz# <Plug>(asterisk-gz#)
