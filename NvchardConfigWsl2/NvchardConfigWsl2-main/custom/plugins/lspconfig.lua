local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- lspconfig.volar.setup {
--   filetypes = { "typescript", "javascript", "vue", "json" },
-- }
local servers = { "html", "cssls", "clangd", "jsonls", "tsserver", "tailwindcss", "bashls", "volar" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
