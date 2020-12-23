let g:vimwiki_global_ext=0
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'path_html': '~/Dropbox/vimwiki_html/'}]
autocmd BufWritePost *.wiki silent VimwikiAll2HTML
