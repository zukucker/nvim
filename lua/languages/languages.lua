local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.tsserver.setup{}

require'lspconfig'.pyright.setup{}

require'lspconfig'.phpactor.setup{}

require'lspconfig'.intelephense.setup{}

vim.diagnostic.config({
  virtual_text = false,
})
