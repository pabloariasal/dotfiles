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
"   Asynchronous Building Configuration
"
" Required Plugins: Neomake
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Add a builder that filters everything that doesn't match errorformat
let g:neomake_make_build_filtered_maker = {
	\ 'exe': 'make',
	\ 'args': ['-C', 'build', '--silent', '-j', '8'],
	\ 'errorformat': '%f:%l:%c: %m',
	\ 'remove_invalid_entries': 1,
	\ 'open_list': 2,
	\ }

"Add a builder that outputs everything
let g:neomake_make_build_maker = {
	\ 'exe': 'make',
	\ 'args': ['-C', 'build', '--silent', '-j', '8'],
	\ 'errorformat': '%f:%l:%c: %m',
	\ 'open_list': 2,
	\ }

"Disable default makers
let g:neomake_cpp_enabled_makers = []
let g:neomake_python_enabled_makers = []
