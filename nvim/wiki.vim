let g:vimwiki_global_ext=0
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'path_html': '~/Dropbox/vimwiki_html/'}]
autocmd BufWritePost *.wiki silent VimwikiAll2HTML

function! ToggleCalendar()
  execute ":CalendarH"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

autocmd FileType vimwiki map <leader>x :call ToggleCalendar()<cr>
