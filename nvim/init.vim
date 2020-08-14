syntax on

filetype plugin indent on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase
set smartindent
set noswapfile
set colorcolumn=80
set so=10
set rnu
set nu

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark



autocmd BufNewFile *.c 0r ~/.config/nvim/templates/skeleton.c
