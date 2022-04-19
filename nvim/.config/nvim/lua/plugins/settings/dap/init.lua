local modules = {
    -- 安装 debugger

    "nvim-dap-install",

    -- debugger
    "nvim-dap",

    -- debug 的时候的 ui
    "nvim-dap-ui",

    -- debug 的时候代码旁边显示的虚拟文字
    "nvim-dap-virtual-text",
}

for _, module_name in ipairs(modules) do
    local module = "plugins.settings.dap." .. module_name
    local ok = pcall(require, module)
    if not ok then
        vim.notify(string.format("load `%s` module setting failed", module))
    end
end
