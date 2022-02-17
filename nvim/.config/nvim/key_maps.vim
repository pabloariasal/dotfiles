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

"go to beginning and end of line
nnoremap <a-h> ^
nnoremap <a-l> $

"navigate by paragraph
nnoremap <silent> <c-j> }
nnoremap <silent> <c-k> {

"open command prompt with comma
nnoremap , :
vnoremap , :

nnoremap <leader>x <cmd>ClearWhitespace<CR>

"toggle line numbers
nnoremap <leader>n <cmd>setlocal number!<CR>

nnoremap <BS> <c-^>

nnoremap <leader>e <cmd>Lex 20<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Populate command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look for word under the cursor
nnoremap <Leader>b :<C-u>grep! '<C-r>=expand("<cword>")<CR>'<CR>
nnoremap <leader>g :<C-u>grep! 
nnoremap <leader>z :<C-u>help 
nnoremap <leader>s q:
nnoremap <leader>t :<C-u>tjump 
nnoremap <leader>o :<C-u>edit 
nnoremap <leader>u :<C-u>find 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quitting and Saving
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w <cmd>wa<cr>
nmap <leader>q <cmd>xa<cr>
nmap <c-q> <cmd>xa!<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate by fold for certain filetypes
autocmd FileType rust,cpp,python,markdown,haskell,lua
            \ nnoremap <buffer> <silent> <c-j> <cmd>execute "keepjumps norm! " . v:count1 . "zj"<CR>
autocmd FileType rust,cpp,python,markdown,haskell,lua
            \ nnoremap <buffer> <silent> <c-k> <cmd>execute "keepjumps norm! " . v:count1 . "zk"<CR>

" toggle fold under the cursor
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
" Registers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rr <cmd>registers<CR>

nnoremap <leader>rc "+
nnoremap <leader>rs "*
nnoremap <leader>rb "_
nnoremap <leader>rt "t

xnoremap <leader>rc "+
xnoremap <leader>rs "*
xnoremap <leader>rb "_
xnoremap <leader>rt "t

nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
xnoremap <leader>y "+y
xnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Server Protocol
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>v <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<Cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: fzf-lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <c-n> <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>j <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>k <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Star
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"search but don't jump
map z*  *N
map z#  #N

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ig <cmd>set spell spelllang=de_de<cr>
nnoremap <leader>ie <cmd>set spell spelllang=en_us<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"
" Required Plugins: nvim-snippy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <expr> <Tab> snippy#can_expand() ? '<Plug>(snippy-expand)' : '<Tab>'
imap <expr> <C-j> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<C-j>'
imap <expr> <C-k> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<C-k>'
smap <expr> <C-j> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<C-j>'
smap <expr> <C-k> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<C-k>'
nmap g<Tab> <Plug>(snippy-cut-text)
xmap <Tab> <Plug>(snippy-cut-text)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"
" reload config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F1> <cmd>source ~/.config/nvim/init.vim<cr>
