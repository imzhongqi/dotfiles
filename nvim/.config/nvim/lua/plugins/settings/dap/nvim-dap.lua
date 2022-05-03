local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end

vim.cmd([[
  highlight debugPC guibg=#3d648b " debug current line
  highlight Breakpoint guifg=#fa0000 
  highlight ConditionBreakpoint guifg=#5c6bc0 
  highlight RejectedBreakpoint guifg=#ffca02
  highlight LogPoint guifg=#f78c6c 
]])

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "Breakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = " ﴕ", texthl = "ConditionBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "RejectedBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "LogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "debugPC", numhl = "" })

require("dap.ext.vscode").load_launchjs()

-- setup dap-go plugin
require("dap-go").setup()
