syntax on
set nocompatible
filetype off
filetype plugin on
filetype indent off

call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Styling
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
" Assets
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
" Testing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
call plug#end()


set mouse=a
colorscheme gruvbox
nnoremap ,t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
nnoremap ,h :FZF<CR>
nnoremap ,so :source $MYVIMRC<CR>
nmap <F3> :e $MYVIMRC<CR>
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
set background=dark
let g:rainbow_active = 1
set guicursor="n-v-c-sm-i:block,ci-ve:ver25,r-cr-o:hor20"

" add transparency to background in vim
hi Normal guibg=NONE ctermbg=NONE

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

lua require'nvim-treesitter.configs'.setup {ensure_installed = "maintained"}

" Load files for Lsp and completion
luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/languages/languages.lua
