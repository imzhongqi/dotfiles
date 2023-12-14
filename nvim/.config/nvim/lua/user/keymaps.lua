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
    -- multi-line macro
    x = {
        ["@"] = [[:<C-u>execute "'<,'>normal @".nr2char(getchar())<CR>]],
    },

    i = {
        [";;"] = {
            callback = "<ESC>",
            opts = { remap = true },
        },
    },

    n = {
        ["<leader>h"] = "<Cmd>nohl<CR>",
        ["<localleader>rn"] = function ()
           require("vscode-neovim").call("editor.action.rename")
        end,
    },

    o = { },
}

local map = function(mode, lhs, rhs, opts)
    return vim.keymap.set(mode, lhs, rhs, opts)
end

-- set the leader key as "<Space>"
map("", "<Space>", "<Nop>")
vim.g.mapleader = "\\"
vim.g.maplocalleader = ";"

local default_opts = { noremap = true, silent = true }

for mode, maps in pairs(keymaps) do
    for lhs, rhs in pairs(maps) do
        if type(rhs) == "table" then
            map(mode, lhs, rhs["callback"], rhs["opts"])
        else
            map(mode, lhs, rhs, default_opts)
        end
    end
end
