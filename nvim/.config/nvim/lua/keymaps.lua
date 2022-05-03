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
        [";;"] = {
            callback = "<ESC>",
            opts = { remap = true },
        },
        -- ["<C-X>"] = {
        --     callback = [[copilot#Accept("<CR>")]],
        --     opts = { silent = true, expr = true, script = true }
        -- },
    },

    n = {
        ["<A-h>"] = function()
            require("smart-splits").resize_left()
        end,
        ["<A-j>"] = function()
            require("smart-splits").resize_down()
        end,
        ["<A-k>"] = function()
            require("smart-splits").resize_up()
        end,
        ["<A-l>"] = function()
            require("smart-splits").resize_right()
        end,
        ["<C-h>"] = function()
            require("smart-splits").move_cursor_left()
        end,
        ["<C-j>"] = function()
            require("smart-splits").move_cursor_down()
        end,
        ["<C-k>"] = function()
            require("smart-splits").move_cursor_up()
        end,
        ["<C-l>"] = function()
            require("smart-splits").move_cursor_right()
        end,

        -- debugger
        ["<M-K>"] = function()
            require("dapui").eval()
        end,
        ["<M-c>"] = function()
            require("dap").continue()
        end,
        ["<M-n>"] = function()
            require("dap").step_over()
        end,
        ["<M-i>"] = function()
            require("dap").step_into()
        end,
        ["<M-o>"] = function()
            require("dap").step_out()
        end,
        ["<M-b>"] = function()
            require("dap").toggle_breakpoint()
        end,

        ["<M-[>"] = "<cmd>bp<CR>",
        ["<M-]>"] = "<cmd>bn<CR>",

        ["<localleader>s"] = function ()
            require("hop").hint_char1()
        end,
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
        gr = function()
            require("lspsaga.rename").rename()
        end,


        ["<localleader>f"] = function()
            require("fzf-lua").files()
        end,

        ["<localleader>*"] = function()
            require("fzf-lua").grep_cword()
        end,
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
