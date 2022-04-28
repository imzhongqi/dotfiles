local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    return
end

dapui.setup({
    icons = { expanded = "", collapsed = "" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },

    sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.4, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.2 },
            { id = "stacks", size = 0.1 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
    },

    tray = {
        elements = {
            { id = "repl", size = 1 },
            -- { id = "watches", size = 0.2 },
        },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },

    floating = {
        max_height = 0.5, -- These can be integers or a float between 0 and 1.
        max_width = 0.5, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },

    windows = { indent = 1 },
})

local dap = require("dap")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open("sidebar")
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close("sidebar")
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close("sidebar")
end
