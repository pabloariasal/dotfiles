"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finding
"
" Required Plugins: fzf and fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show fuzzy window at the bottom of the screen
let g:fzf_layout = { 'down': '40%', 'window': '15new' }

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BDel call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
