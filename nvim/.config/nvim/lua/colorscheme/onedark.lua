local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

onedark.setup({
    sidebars = { "qf", "vista_kind", "terminal", "packer", "dapui_scopes" },

    colors = {
        bg0 = "#1b212a",
        bg1 = "#161b22",
        bg_sidebar = "#161b22",
        bg_linenumber = "#1b212a",

        hint = "orange0",
        error = "#ff0000",
    },

    keyword_style = "bold",

    overrides = function(c)
        return {
            CursorLineNr = { bg = "NONE" },
            TabLine = { bg = c.bg1 },
            TabLineFill = { bg = c.bg1 },
            NormalFloat = { bg = c.bg1 },
            FloatBorder = { bg = c.bg0 },
            VertSplit = { bg = c.bg1, fg = c.bg0 },

            -- Treesitter
            TSInclude = { style = "bold" },
            TSConditional = { style = "bold" },
            LspReferenceText = { bg = "#41464f" },

            -- Telescope
            TelescopeNormal = { bg = c.bg1 },
            TelescopeBorder = { fg = "#61afef", bg = c.bg1 },

            -- DAP UI
            DapUIVariable = { link = "Normal" },
            DapUIScope = { fg = "#ffffff" },
            DapUIType = { fg = "#60878b" },
            DapUIValue = { link = "Normal" },
            DapUIModifiedValue = { fg = "#00F1F5", style = "bold" },
            DapUIDecoration = { fg = "#fcecc5" },
            DapUIThread = { fg = "#434649" },
            DapUIStoppedThread = { fg = "#ffffff" },
            DapUIFrameName = { link = "Normal" },
            DapUISource = { fg = "#106ba3" },
            DapUILineNumber = { fg = "#949699" },
            DapUIFloatBorder = { fg = "ffffff" },
            DapUIWatchesEmpty = { fg = "#F70067" },
            DapUIWatchesValue = { fg = "#A9FF68" },
            DapUIWatchesError = { fg = "F70067" },
            DapUIBreakpointsPath = { fg = "#ffffff" },
            DapUIBreakpointsInfo = { fg = "#949699" },
            DapUIBreakpointsCurrentLine = { fg = "#949699", style = "bold" },
            DapUIBreakpointsLine = { link = "DapUILineNumber" },
        }
    end,
})
