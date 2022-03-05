-- https://github.com/glepnir/nvim-lua-guide-zh#%E5%AE%9A%E4%B9%89%E6%98%A0%E5%B0%84
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local keymap = function(type, key, cmd, opts)
  return vim.api.nvim_set_keymap(type, key, cmd, opts)
end

local vmap = function(key, cmd)
  return keymap("x", key, cmd, opts)
end

local nmap = function(key, cmd)
  return keymap("n", key, cmd, opts)
end

nmap("<M-+>", "<cmd>resize +2<cr>")
nmap("<M-_>", "<cmd>resize -2<cr>")
nmap("<M-=>", "<cmd>vertical resize +2<cr>")
nmap("<M-->", "<cmd>vertical resize -2<cr>")

-- tab switch 1-9
vim.cmd[[ command! -nargs=1 G BufferLineGoTo <args>]]
for i = 1, 9 do
  nmap("<leader>" .. i, "<cmd>G " .. i .. "<cr>")
end
nmap("<M-[>", "<cmd>bp<cr>")
nmap("<M-]>", "<cmd>bn<cr>")

nmap("<M-k>", "<cmd>lua require('dapui').eval()<cr>")
nmap("<M-c>", "<cmd>lua require('dap').continue()<cr>")
nmap("<Tab>", "<cmd>lua require('dap').step_over()<cr>")
nmap("<M-i>", "<cmd>lua require('dap').step_into()<cr>")
nmap("<M-o>", "<cmd>lua require('dap').step_out()<cr>")
nmap("<M-b>", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
nmap("gR", "<cmd>Trouble lsp_references<cr>")

