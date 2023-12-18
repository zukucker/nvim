syntax on
set nocompatible
filetype off
filetype plugin on
filetype indent off

" Autoinstall vim-plug 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" old LSP
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" shopware stuff
Plug 'blueyed/smarty.vim'
Plug 'nelsyeung/twig.vim'

" fuzzy
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Styling
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'

" Assets
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'

" Testing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"
"
"
"
"
"
"Testing stuff
" LSP Support
  "Plug 'neovim/nvim-lspconfig'             " Required
  "Plug 'williamboman/mason.nvim'           " Optional
  "Plug 'williamboman/mason-lspconfig.nvim' " Optional
  "" Autocompletion
  "Plug 'hrsh7th/nvim-cmp'         " Required
  "Plug 'hrsh7th/cmp-nvim-lsp'     " Required
  "Plug 'L3MON4D3/LuaSnip'         " Required
  "Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()

" Load files for Lsp and completion
"luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/languages/languages.lua

set rtp+=~/.config/nvim/twig-directory-plugin

colorscheme dracula
set colorcolumn=80
set mouse=a
noremap ,t :NERDTreeToggle<CR>
noremap ,h :Files<CR>
noremap ,rg :RG<CR>
let NERDTreeMinimalUI = 1
nnoremap ,so :source $MYVIMRC<CR>
nmap <F3> :e $HOME/.config/nvim<CR>
nmap <F4> :e $HOME/.config/nvim/lua/languages/languages.lua<CR>
set scrolloff=7
set laststatus=2
set noswapfile
set rnu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
:let mapleader = ","
set completeopt+=menuone
set hlsearch
set ignorecase
set guicursor="n-v-c-sm-i:block,ci-ve:ver25,r-cr-o:hor20"
let NERDTreeShowHidden=1
hi Normal guibg=NONE ctermbg=NONE

" Remaps
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

