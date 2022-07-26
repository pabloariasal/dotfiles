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
nnoremap <silent> <a-h> ^
nnoremap <silent> <a-l> $

"navigate tabs
nnoremap <silent> <a-j> gt
nnoremap <silent> <a-k> gT

"open command prompt with comma
nnoremap , :
vnoremap , :

nnoremap <leader>x <cmd>ClearWhitespace<CR>

nnoremap <BS> <c-^>

nnoremap <leader>e <cmd>EditVifm<CR>

" maximize current window split
nnoremap <silent><leader>l :MaximizerToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Populate command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look for word under the cursor
nnoremap <Leader>gc :<C-u>grep! '<C-r>=expand("<cword>")<CR>'<CR>
nnoremap <leader>gn :<C-u>grep! 
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

" resize
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" navigate splits
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix list and Location List
"
" Required Plugins: vim-qf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap gq <Plug>(qf_qf_toggle)
nmap gl <Plug>(qf_loc_toggle)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Registers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <silent> <leader>d <cmd>lua vim.diagnostic.setloclist()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<Cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <c-n> <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').live_grep()<CR>

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
