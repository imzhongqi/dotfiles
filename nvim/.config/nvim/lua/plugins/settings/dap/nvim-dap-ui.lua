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
