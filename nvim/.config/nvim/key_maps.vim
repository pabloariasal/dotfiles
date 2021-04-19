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

"best mapping ever
inoremap jj <ESC>

"grep for word under the cursor
nnoremap <Leader>r :<C-u>grep '<C-r>=expand("<cword>")<CR>'<CR>

" Indent visual block
vmap < <gv
vmap > >gv

"jump to alternate file
nmap <silent> <leader>a <cmd>Alternate<CR>

" close current buffer
nnoremap <silent> <leader>c <cmd>bp <bar>bd #<cr>

" Don't write { } motions to the jump list
nnoremap <silent> } <cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { <cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>

"switch to alternate buffer
nnoremap <BS> <C-^>

"go to beginning and end of line
nnoremap <a-h> ^
nnoremap <a-l> $

"navigate by paragraph
nnoremap <silent> <c-j> }
nnoremap <silent> <c-k> {

"open command prompt with comma
nnoremap , :
vnoremap , :

nnoremap <leader>e <cmd>ClearWhitespace<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quitting and Saving
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w <cmd>wa<cr>
nmap <leader>q <cmd>q<cr>
nmap <leader><leader>q <cmd>qa<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"interact with system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
xnoremap <leader>y "+y
xnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cycle through splits
noremap <c-h> <c-w><c-w>

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
" Navigate by fold for certain filetypes
autocmd FileType rust,cpp,python,markdown,haskell
            \ nnoremap <buffer> <silent> <c-j> <cmd>execute "keepjumps norm! " . v:count1 . "zj"<CR>
autocmd FileType rust,cpp,python,markdown,haskell
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
nmap gq <Plug>(qf_qf_toggle)
nmap gl <Plug>(qf_loc_toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>k <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<Cr>

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search but don't jump
map z*  *N
map z#  #N
