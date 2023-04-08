" use space as leader
let mapleader=" "

"but don't lose reverse motion
noremap \ ,

"best mapping ever
inoremap jj <ESC>

" Indent visual block
vmap < <gv
vmap > >gv

"jump to alternate file
nmap <leader>a <cmd>lua require('alternate').alternate()<CR>

" close current buffer
nnoremap <silent> <leader>c <cmd>bp <bar>bd #<cr>

" Don't write { } motions to the jump list
nnoremap <silent> } <cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { <cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>

"open command prompt with comma
nnoremap , :
vnoremap , :

nnoremap <leader>e <cmd>EditVifm<CR>

" maximize current split
nnoremap <leader>l <cmd>MaximizerToggle<CR>
vnoremap <leader>l <cmd>MaximizerToggle<CR>gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Populate command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"look for word under the cursor
nnoremap <Leader>gc :<C-u>grep! '<C-r>=expand("<cword>")<CR>'<CR>
nnoremap <leader>gn :<C-u>grep! 
nnoremap <leader>t :<C-u>tjump 

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
" System clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
xnoremap <leader>y "+y
xnoremap <leader>p "+p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <c-n> <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>j <cmd>lua require('telescope.builtin').current_buffer_tags()<CR>
nnoremap <leader>r <cmd>lua require('telescope.builtin').oldfiles()<CR>
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
" Misc
"
" reload config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F1> <cmd>source ~/.config/nvim/init.vim<cr>
