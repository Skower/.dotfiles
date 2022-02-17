set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
call plug#end()

colorscheme ayu
set termguicolors
" Remove theme background (Should be after colorscheme)
hi Normal guibg=NONE ctermbg=NONE
hi airline_c  ctermbg=NONE guibg=NONE
hi airline_tabfill ctermbg=NONE guibg=NONE

let mapleader = " "
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
