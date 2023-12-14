local modules = {
    "comment",
    "impatient",
    "indent-o-matic",
    "nvim-hop",
    "surround",
    "treesitter",
    "neotree",
}

local M = {}

function M.setup()
    for _, module_name in ipairs(modules) do
        local module = "plugins.settings." .. module_name
        local ok, v = pcall(require, module)
        if not ok then
            vim.notify(string.format("load `%s` module setting failed, error: %s", module, v), vim.log.levels.WARN)
            goto continue
        end

        if type(v) == "table" and v.setup then
            v.setup()
        end
        ::continue::
    end
end

return M
