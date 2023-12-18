syntax on
set nocompatible
filetype off
filetype plugin on
filetype indent off

call plug#begin()
" LSP
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'blueyed/smarty.vim'
Plug 'nelsyeung/twig.vim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Styling
Plug 'navarasu/onedark.nvim'
Plug 'ap/vim-css-color'
Plug 'nvim-lualine/lualine.nvim'

" Assets
Plug 'preservim/nerdcommenter'
Plug 'nvim-tree/nvim-tree.lua'

" Testing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GTA STUFF
Plug 'tibabit/vim-templates'
call plug#end()

" Load files for Lsp and completion
luafile ~/.config/nvim/lua/languages/languages.lua



colorscheme onedark
let g:tmpl_search_paths = ['~/.config/nvim/templates']
set list
set listchars+=space:␣
set mouse=a
set textwidth=80
noremap ,t :NvimTreeToggle<CR>
noremap ,h :Files<CR>
noremap ,r :RG<CR>
let NERDTreeMinimalUI = 1
nnoremap ,so :source $MYVIMRC<CR>
nmap <F3> :Files ~/.config/nvim<CR>
nmap <F4> :e $HOME/.config/nvim/lua/languages/languages.lua<CR>
set laststatus=2
set noswapfile
set rnu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
:let mapleader = ","
set completeopt+=menuone
set hlsearch
set ignorecase

"GTA STUFF
nnoremap <leader>cfx <cmd>TemplateInit fxmanifest<cr>
nnoremap <leader>ch <cmd>TemplateInit html<cr>




lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
    -- See `:help lualine.txt`
})
require('lualine').setup{
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
}
require("mason").setup()
EOF
