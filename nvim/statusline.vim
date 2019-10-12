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
"   Status Line Configuration
"
" Required Plugins: vim-sleuth, neomake
"   
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NeomakeStatus()
 return neomake#statusline#get(g:actual_curbuf, {
	    \ 'use_highlights_with_defaults': 0,
	    \ 'format_running':'({{running_job_names}})…',
	    \ 'format_status': '[%s]',
	    \ 'format_loclist_unknown': '',
	    \})
endfunction

set statusline+=%F
set statusline+=%m
set statusline+=%h
set statusline+=%r
set statusline+=\ 
set statusline+=%{NeomakeStatus()}
set statusline+=%=
set statusline+=\ 
set statusline+=%{SleuthIndicator()}
set statusline+=\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
set statusline+=%y
set statusline+=\ 
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%P
