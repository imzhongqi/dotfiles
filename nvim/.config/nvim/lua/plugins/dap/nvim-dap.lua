local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

vim.cmd [[
  highlight debugPC guibg=#1c5187 " debug current line
  highlight Breakpoint guifg=#fa0000 
  highlight ConditionBreakpoint guifg=#5c6bc0 
  highlight RejectedBreakpoint guifg=#fced2c 
  highlight LogPoint guifg=#f78c6c 
]]

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "Breakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = " ﴕ", texthl = "ConditionBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "RejectedBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "LogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "debugPC", numhl = "" })

-- setup dap-go plugin
require("dap-go").setup()
