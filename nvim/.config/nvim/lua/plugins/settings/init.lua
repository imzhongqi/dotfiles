local modules = {
    "autopairs",
    "comment",
    "impatient",
    "indent-o-matic",
    "nvim-hop",
    "surround",
    "treesitter",
}

local M = {}

function M.setup()
    for _, module_name in ipairs(modules) do
        local module = "plugins.settings." .. module_name
        local ok, v = pcall(require, module)
        if not ok then
            vim.notify(string.format("load `%s` module setting failed, error: %s", module, v), "warn")
            goto continue
        end

        if type(v) == "table" and v.setup then
            v.setup()
        end
        ::continue::
    end
end

return M
