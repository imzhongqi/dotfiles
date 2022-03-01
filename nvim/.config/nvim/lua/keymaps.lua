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

nmap("<M-S-j>", "<cmd>resize +2<cr>")
nmap("<M-S-k>", "<cmd>resize -2<cr>")
nmap("<M-S-h>", "<cmd>vertical resize -2 <cr>")
nmap("<M-S-l>", "<cmd>vertical resize +2 <cr>")

-- tab switch 1-9
for i = 1, 9 do
	nmap("<leader>" .. i, "<cmd>BufferLineGoTo " .. i .. "<cr>")
end

nmap("<leader><S-K>", "<cmd>lua require('dapui').eval()<cr>")
nmap("<leader><C-c>", "<cmd>lua require('dap').continue()<cr>")
nmap("<C-o>", "<cmd>lua require('dap').step_over()<cr>")
nmap("<Tab>", "<cmd>lua require('dap').step_into()<cr>")
nmap("<S-Tab>", "<cmd>lua require('dap').step_out()<cr>")
nmap("<C-b>", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
