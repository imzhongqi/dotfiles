local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

go.setup {
  comment_placeholder = "",
  dap_debug = false,
  dap_debug_keymap = false,
}

local lsp_installer_servers = require "nvim-lsp-installer.servers"

local server_available, requested_server = lsp_installer_servers.get_server "gopls"
if server_available then
  requested_server:on_ready(function()
    -- local opts = require("go.lsp").config()
    -- requested_server:setup(opts)
  end)
end
