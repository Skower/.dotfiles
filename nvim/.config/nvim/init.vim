" init.vim for NeoVim
" Authors : Skower

" Required :
call plug#begin('~/.vim/plugged') 

"" Pulg install packages
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' 

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

Plug 'lervag/vimtex'

Plug 'github/copilot.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"" Basic Setup
set encoding=utf-8
set ttyfast " Speed up scrolling in Vim
set backspace=indent,eol,start
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch " Incremental searching
syntax on
set ruler
set number 
set relativenumber 
set nowrap
set scrolloff=6
set guicursor=
set noswapfile
set nocompatible

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

colorscheme onedark
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
"" Vimtex
filetype plugin indent on

" Map leader
let mapleader = " "

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" Harpoon
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>& :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>é :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>" :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>' :lua require("harpoon.ui").nav_file(4)<CR>

"" Telescope
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <C-p> :Telescope git_files<CR>
nnoremap <leader>pf :Telescope find_files<CR>

nnoremap <silent>nh :noh<CR>

"" Coc
set hidden
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


"" nnoremap <leader>ce :CocEnable <CR>
"" nnoremap <leader>cd :CocDisable <CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>ac  <Plug>(coc-codeaction)

"" Copilot
let g:copilot_filetypes = {
            \ '*': v:false,
            \ 'python': v:true,
            \ 'c': v:true,
            \ 'cpp': v:true,
            \ }

"" Vimtex
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
