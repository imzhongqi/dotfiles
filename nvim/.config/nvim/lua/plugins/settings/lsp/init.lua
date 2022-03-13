local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugins.settings.lsp.lsp-installer"
require("plugins.settings.lsp.handlers").setup()
require "plugins.settings.lsp.null-ls"
require "plugins.settings.lsp.lsp-status"
