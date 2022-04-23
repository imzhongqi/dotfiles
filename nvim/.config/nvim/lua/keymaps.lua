-- https://github.com/glepnir/nvim-lua-guide-zh#%E5%AE%9A%E4%B9%89%E6%98%A0%E5%B0%84
--
-- String     value	Help page	      Affected modes	                                                Vimscript equivalent
-- ''         (an empty string)	    mapmode-nvo	Normal, Visual, Select, Operator-pending	          :map
-- 'n'	      mapmode-n	            Normal	                                                        :nmap
-- 'v'	      mapmode-v	            Visual and Select	                                              :vmap
-- 's'	      mapmode-s	            Select	                                                        :smap
-- 'x'	      mapmode-x	            Visual	                                                        :xmap
-- 'o'	      mapmode-o	            Operator-pending	                                              :omap
-- '!'	      mapmode-ic	          Insert and Command-line	                                        :map!
-- 'i'	      mapmode-i	            Insert	                                                        :imap
-- 'l'	      mapmode-l	            Insert, Command-line, Lang-Arg	                                :lmap
-- 'c'	      mapmode-c	            Command-line	                                                  :cmap
-- 't'	      mapmode-t	            Terminal	                                                      :tmap

local keymap = function(type, key, cmd, opts)
    return vim.api.nvim_set_keymap(type, key, cmd, opts)
end

local opts = { noremap = true, silent = true }

-- local vmap = function(key, cmd)
--   return keymap("x", key, cmd, opts)
-- end

local map = function(key, cmd)
    return keymap("", key, cmd, opts)
end

local nmap = function(key, cmd)
    return keymap("n", key, cmd, opts)
end

local omap = function(key, cmd)
    return keymap("o", key, cmd, opts)
end

-- set the leader key as "<Space>"
map("<Space>", "<Nop>")
vim.g.mapleader = " "

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

-- tab switch 1-9
for i = 1, 9 do
    nmap("<leader>" .. i, "<cmd>BufferLineGoTo " .. i .. "<CR>")
end
nmap("<M-[>", "<cmd>bp<CR>")
nmap("<M-]>", "<cmd>bn<CR>")

-- debugger
nmap("<M-k>", "<cmd>lua require('dapui').eval()<CR>")
nmap("<M-c>", "<cmd>lua require('dap').continue()<CR>")
nmap("<M-n>", "<cmd>lua require('dap').step_over()<CR>")
nmap("<M-i>", "<cmd>lua require('dap').step_into()<CR>")
nmap("<M-o>", "<cmd>lua require('dap').step_out()<CR>")
nmap("<M-b>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
nmap("gR", "<cmd>Trouble lsp_references<CR>")

nmap(
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
nmap(
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)
omap(
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<CR>"
)
omap(
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<CR>"
)
map(
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
)
map(
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
)

nmap("gr", "<cmd>lua require('lspsaga.rename').rename()<CR>")

nmap("gb", "<cmd>BufferLinePick<CR>")

vim.cmd([[
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
]])
