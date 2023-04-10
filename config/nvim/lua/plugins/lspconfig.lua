local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup{}
lspconfig.intelephense.setup{
  capabilities = capabilities, 
  init_options = {
  },
  cmd = {"intelephense", "--stdio"},
  filetypes = { "php" },
}
require('lspconfig').dockerls.setup{}
