local M = {}

function M.setup()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
        return
    end

    toggleterm.setup({
        size = 20,
        open_mapping = [[<C-t>]],
        on_open = function()
            local opts = { noremap = true }
            vim.api.nvim_buf_set_keymap(0, "t", "<localleader><localleader>", [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<localleader><C-h>", [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<localleader><C-j>", [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<localleader><C-k>", [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, "t", "<localleader><C-l>", [[<C-\><C-n><C-W>l]], opts)
        end,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = false,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 20,
            height = 30,
            width = 120,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
        on_open = function(term)
            pcall(vim.api.nvim_buf_del_keymap, term.bufnr, "t", "<esc>")
        end,
        direction = "float",
        cmd = "lazygit",
        hidden = true,
    })

    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
    end
end

return M
