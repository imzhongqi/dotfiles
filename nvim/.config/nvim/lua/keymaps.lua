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

nmap("<M-j>", "<cmd>resize +2<cr>")
nmap("<M-k>", "<cmd>resize -2<cr>")
nmap("<M-h>", "<cmd>vertical resize -2 <cr>")
nmap("<M-l>", "<cmd>vertical resize +2 <cr>")

-- tab switch 1-9
for i = 1, 9 do
	nmap("<leader>" .. i, "<cmd>BufferGoto " .. i .. "<cr>")
end

-- Debugger key map
-- nmap("", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
nmap("<C-e>", "<cmd>lua require('dapui').eval()<cr>")

vim.cmd([[
  nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
  nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
  nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
  nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
  nnoremap <silent> <C-b> :lua require'dap'.toggle_breakpoint()<CR>
  nnoremap <silent> <C-B> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
  nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
  nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
  nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]])
