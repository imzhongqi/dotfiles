local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end


require "plugins.lsp.lsp-installer"
require("plugins.lsp.handlers").setup()
require "plugins.lsp.null-ls"
