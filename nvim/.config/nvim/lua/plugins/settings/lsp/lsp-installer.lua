local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

lsp_installer.setup({
    install_root_dir = require("nvim-lsp-installer.path").concat({ vim.fn.stdpath("data"), "lsp-servers" }),
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
    },
})

local lspconfig = require("lspconfig")
local handlers = require("plugins.settings.lsp.handlers")

local function load_lsp_settings(server_name)
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }
    local loaded, lsp_settings = pcall(require, "plugins.settings.lsp.settings." .. server_name)
    if not loaded then
        return opts
    end
    return vim.tbl_deep_extend("force", opts, lsp_settings)
end

local servers = {
    "gopls",
    "sumneko_lua",
    "jsonls",
}

for _, server_name in pairs(servers) do
    local settings = load_lsp_settings(server_name)
    lspconfig[server_name].setup(settings)
end
