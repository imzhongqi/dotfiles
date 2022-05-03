local status_ok, dap_installer = pcall(require, "dap-install")
if not status_ok then
    return
end

local installation_path = vim.fn.stdpath("data") .. "/daps"
dap_installer.setup({
    installation_path = installation_path,
    verbosely_call_debuggers = true,
})

dap_installer.config("go", {})
dap_installer.config("python", {})
