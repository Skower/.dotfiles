"
"   Personal init.vim for NeoVim of Skower
"

"------------------------
"   General Settings
"------------------------

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4 
set hidden
set number 
set relativenumber 
set encoding=utf-8
set ttyfast " Speed up scrolling in Vim
set backspace=indent,eol,start
set smartindent
set incsearch " Incremental searching
syntax on
set ruler
set nowrap
set scrolloff=6
set sidescrolloff=6
set guicursor=
set noswapfile
set nocompatible


"------------------------
"   Plugins
"------------------------

call plug#begin('~/.vim/plugged') 

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' 

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"-----------------------
"   Color Schemes
"-----------------------

colorscheme gruvbox
set termguicolors
hi Normal guibg=NONE ctermbg=NONE


"------------------------
"   Shortcuts
"------------------------

let mapleader = " "

"   Harpoon
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>& :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>é :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>" :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>' :lua require("harpoon.ui").nav_file(4)<CR>

"   Telescope
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <leader>pf :Telescope find_files<CR>
nnoremap <silent>nh :noh<CR>

"   Coc
set nobackup
set nowritebackup
set updatetime=300

" Navigation in suggestions with Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
