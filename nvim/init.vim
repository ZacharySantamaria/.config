syntax on

filetype plugin indent on
set noerrorbells

" Deals with tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Deal with the number columns
set nu
set autowrite
set nohlsearch
set hidden
set nowrap

" Mouse setting for scrolling when needed
set mouse=a

" Shows where I am in the file easily
set cursorline

" Finding a solution to undo files and a way to manage it
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Centered movements when going down
set colorcolumn=80
set signcolumn=yes
set scrolloff=10

" Give more space for displaying messages.
set cmdheight=2

" Setting up a plugin manager
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter' " Commenting for a better workflow
Plug 'gruvbox-community/gruvbox' " Adds colorscheme to nvim
Plug 'bling/vim-airline' " Nice status bar
Plug '9mm/vim-closer' " Matching end parens, brackets, etc
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tweekmonster/startuptime.vim'
call plug#end()

" Setting leader key
let mapleader = ' '

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

set cot=menuone,noinsert,noselect shm+=c

command! Format execute 'lua vim.lsp.buf.formatting()'


" Using the example from the github to add LSP to nvim
:lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end
  local servers = {'clangd', 'vimls', 'ocamllsp'}
  for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup { on_attach = on_attach }
  end
EOF


colorscheme gruvbox
highlight Normal guibg=none

"Removing the trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" autocmd BufNewFile *.c 0r ~/.config/nvim/templates/skeleton.c
