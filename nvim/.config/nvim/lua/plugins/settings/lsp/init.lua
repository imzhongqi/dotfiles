local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("plugins.settings.lsp.handlers").setup()

local modules = {
    "nlsp-settings",
    "lsp-installer",
    "null-ls",
    "status",
    "signature",
    "lspsaga",
}

for _, module in ipairs(modules) do
    require("plugins.settings.lsp." .. module)
end
