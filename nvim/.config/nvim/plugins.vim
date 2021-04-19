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
"   List of plugins used throughout configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-qf'
Plug 'markonm/traces.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-obsession'
Plug 'pabloariasal/vim-alternate'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'masukomi/vim-markdown-folding'
" Python
Plug 'tmhedberg/SimpylFold'
" Haskell
Plug 'itchyny/vim-haskell-indent'
Plug 'Twinside/vim-haskellFold'
call plug#end()
