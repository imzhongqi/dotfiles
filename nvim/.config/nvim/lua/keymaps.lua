-- https://github.com/glepnir/nvim-lua-guide-zh#%E5%AE%9A%E4%B9%89%E6%98%A0%E5%B0%84
--
-- String value        Help page                Affected modes                                            Vimscript equivalent
-- ''                  (an empty string)        mapmode-nvoormal, Visual, Select, Operator-pending        :map
-- 'n'                 mapmode-n                Normal                                                    :nmap
-- 'v'                 mapmode-v                Visual and Select                                         :vmap
-- 's'                 mapmode-s                Select                                                    :smap
-- 'x'                 mapmode-x                Visual                                                    :xmap
-- 'o'                 mapmode-o                Operator-pending                                          :omap
-- '!'                 mapmode-ic               Insert and Command-line                                   :map!
-- 'i'                 mapmode-i                Insert                                                    :imap
-- 'l'                 mapmode-l                Insert, Command-line, Lang-Arg                            :lmap
-- 'c'                 mapmode-c                Command-line                                              :cmap
-- 't'                 mapmode-t                Terminal                                                  :tmap

local keymaps = {
    [""] = {
        t = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
            })
        end,
        T = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
            })
        end,
    },

    -- multi-line macro
    x = {
        ["@"] = [[:<C-u>execute "'<,'>normal @".nr2char(getchar())<CR>]],
    },

    i = {
        -- ["<C-X>"] = {
        --     callback = [[copilot#Accept("<CR>")]],
        --     opts = { silent = true, expr = true, script = true }
        -- },
    },

    n = {
        ["<A-h>"] = require("smart-splits").resize_left,
        ["<A-j>"] = require("smart-splits").resize_down,
        ["<A-k>"] = require("smart-splits").resize_up,
        ["<A-l>"] = require("smart-splits").resize_right,
        ["<C-h>"] = require("smart-splits").move_cursor_left,
        ["<C-j>"] = require("smart-splits").move_cursor_down,
        ["<C-k>"] = require("smart-splits").move_cursor_up,
        ["<C-l>"] = require("smart-splits").move_cursor_right,

        -- debugger
        ["<M-k>"] = "<cmd>lua require('dapui').eval()<CR>",
        ["<M-c>"] = "<cmd>lua require('dap').continue()<CR>",
        ["<M-n>"] = "<cmd>lua require('dap').step_over()<CR>",
        ["<M-i>"] = "<cmd>lua require('dap').step_into()<CR>",
        ["<M-o>"] = "<cmd>lua require('dap').step_out()<CR>",
        ["<M-b>"] = "<cmd>lua require('dap').toggle_breakpoint()<CR>",

        ["<M-[>"] = "<cmd>bp<CR>",
        ["<M-]>"] = "<cmd>bn<CR>",

        f = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
            })
        end,
        F = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
            })
        end,

        gb = "<cmd>BufferLinePick<CR>",
        gR = "<cmd>Trouble lsp_references<CR>",
        gr = "<cmd>lua require('lspsaga.rename').rename()<CR>",
    },

    o = {
        f = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
                inclusive_jump = true,
            })
        end,
        F = function()
            require("hop").hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
                inclusive_jump = true,
            })
        end,
    },
}

local map = function(mode, lhs, rhs, opts)
    return vim.keymap.set(mode, lhs, rhs, opts)
end

-- set the leader key as "<Space>"
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- set local leader
vim.g.maplocalleader = ";"

local opts = { noremap = true, silent = true }

for mode, maps in pairs(keymaps) do
    for lhs, rhs in pairs(maps) do
        if type(rhs) == "table" then
            map(mode, lhs, rhs["callback"], rhs["opts"])
        else
            map(mode, lhs, rhs, opts)
        end
    end
end

-- tab switch 1-9
for i = 1, 9 do
    map("n", "<leader>" .. i, "<cmd>BufferLineGoTo " .. i .. "<CR>", opts)
end
