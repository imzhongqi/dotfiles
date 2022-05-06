local modules = {
    "impatient",

    "nvim-web-devicons",

    "nvim-notify",

    "lsp",

    "dap",

    "nvim-tree",

    "telescope",

    "treesitter",

    "comment",

    "autopairs",

    "gitsigns",

    "lualine",

    "whichkey",

    -- 上方的类似 tab 的选项卡
    "bufferline",

    -- terminal
    "toggleterm",

    -- 补全
    "cmp",

    -- 缩进线
    "indentline",

    -- 诊断
    "trouble",

    -- 滚动条
    "neoscroll",

    -- 高亮当前光标内容
    "illuminate",

    -- "project",

    "toggle-proxy",

    "languages",

    "nvim-hop",

    "smart-splits",

    "indent-o-matic",

    "symbols-outline",

    "fzf-lua",

    "surround",
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
