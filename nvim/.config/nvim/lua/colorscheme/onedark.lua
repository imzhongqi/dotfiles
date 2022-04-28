local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

onedark.setup({
    sidebars = { "qf", "vista_kind", "terminal", "packer", "dapui_scopes" },

    colors = {
        bg0 = "#22272e",
        bg1 = "#1c2128",
        bg_highlight = "#1c2128",
        hint = "orange0",
        error = "#ff0000",
        bg_sidebar = "#1c2128",
        bg_linenumber = "#22272e",
    },

    keyword_style = "bold",

    overrides = function(c)
        return {
            TSInclude = {
                style = "bold",
            },
            TSConditional = {
                style = "bold",
            },
            LspReferenceText = {
                bg = "#41464f",
            },
            TelescopeNormal = {
                bg = c.bg1,
            },
            TelescopeBorder = {
                fg = "#61afef",
                bg = c.bg1,
            },
            CursorLineNr = {
                bg = "NONE",
            },
            VertSplit = {
                bg = c.bg1,
                fg = c.bg0,
            },
        }
    end,
})
