local which_key = require("plugins.settings.whichkey")

local M = {}

function M.setup()
    which_key.register({
        ["<C-t>"] = { "<cmd>lua require('dapui').toggle('tray')<cr>", "Toggle Dap UI Tray" },
        ["<C-s>"] = { "<cmd>lua require('dapui').toggle('sidebar')<cr>", "Toggle Dap UI Sidebar" },

        c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },

        d = { "<cmd>lua require('dap').close()<cr>", "Disconnect Dap" },

        r = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor" },

        t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Run Test" },

        s = { "<cmd>syntax sync fromstart<cr>", "Syntax Sync fromstart" },

        b = {
            name = "Breakpoint",

            b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },

            r = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Remove All Breakpoint" },

            c = {
                "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                "Set Conditon Breakpoint",
            },

            l = {
                "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
                "Set Log Breakpoint",
            },
        },

        p = { "<cmd>lua toggle_proxy()<cr>", "Toggle Proxy" },
    }, {
        mode = "n", -- NORMAL mode
        prefix = "<C-X>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    })
end

return M
