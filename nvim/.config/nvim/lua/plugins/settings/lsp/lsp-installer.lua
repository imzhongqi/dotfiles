local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.settings {
  install_root_dir = require("nvim-lsp-installer.path").concat { vim.fn.stdpath "data", "lsp-servers" },
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

local function load_lsp_config(server_name, options)
  local loaded, opts = pcall(require, "plugins.settings.lsp.settings." .. server_name)
  if not loaded then
    return options
  end
  return vim.tbl_deep_extend("force", opts, options)
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("plugins.settings.lsp.handlers").on_attach,
    capabilities = require("plugins.settings.lsp.handlers").capabilities,
  }

  opts = load_lsp_config(server.name, opts)

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
