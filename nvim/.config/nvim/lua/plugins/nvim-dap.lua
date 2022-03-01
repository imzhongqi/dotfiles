local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "breakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "breakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "debugPC", numhl = "" })

require("dap-go").setup()

local keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true }

