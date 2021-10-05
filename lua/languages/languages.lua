require'lspconfig'.cssls.setup{}

require'lspconfig'.html.setup{
 init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    }
}

require'lspconfig'.tsserver.setup{}

require'lspconfig'.pyright.setup{}

require'lspconfig'.phpactor.setup{}
