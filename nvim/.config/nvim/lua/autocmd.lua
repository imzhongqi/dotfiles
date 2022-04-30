vim.cmd([[
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _ssh_config_filetype
    autocmd!
    autocmd BufEnter *ssh/**/*.conf set filetype=sshconfig
  augroup end

]])

local auto_groups = {
    {
        event = { "BufWritePre" },
        pattern = { "*.go" },
        callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
            for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
                    else
                        vim.lsp.buf.execute_command(r.command)
                    end
                end
            end
        end,
    },

    -- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ["_close_nvim_tree_last_win"] = {
        groups = {
            {
                event = "BufEnter",
                pattern = "*",
                callback = function()
                    if vim.fn.winnr("$") == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
                        vim.cmd("quit")
                    end
                end,
                opts = { nested = true },
            },
        },
    },

    -- augroup _general_settings
    --   autocmd!
    --   autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    --   autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    --   autocmd BufWinEnter * :set formatoptions-=cro
    --   autocmd FileType qf set nobuflisted
    -- augroup end
    ["general_settings"] = {
        opts = {
            clear = true,
        },
        groups = {
            {
                event = "TextYankPost",
                pattern = "*",
                callback = function()
                    require("vim.highlight").on_yank({ higroup = "Visual", timeout = 200 })
                end,
                opts = {},
            },
            {
                event = "FileType",
                pattern = { "qf", "help", "man", "lspinfo" },
                command = "nnoremap <silent> <buffer> q :close<CR>",
            },
            {
                event = "BufWinEnter",
                pattern = "*",
                command = "set formatoptions-=cro",
            },
            {
                event = "FileType",
                pattern = "qf",
                command = "set nobuflisted",
            },
        },
    },

    -- augroup _markdown
    --   autocmd!
    --   autocmd FileType markdown setlocal wrap
    --   autocmd FileType markdown setlocal spell
    -- augroup end
    ["_markdown"] = {
        opts = { clear = true },
        groups = {
            {
                event = "FileType",
                pattern = "markdown",
                command = "setlocal wrap",
            },
            {
                event = "FileType",
                pattern = "markdown",
                command = "setlocal spell",
            },
        },
    },
}

for group_name, group_settings in pairs(auto_groups) do
    assert(type(group_settings == "table"), "group settings type must be table")

    if type(group_name) == "string" then
        local group = vim.api.nvim_create_augroup(group_name, group_settings.opts or {})
        for _, g in ipairs(group_settings.groups) do
            local opts = vim.tbl_deep_extend("keep", {
                group = group,
                pattern = g.pattern,
                command = g.command,
                callback = g.callback,
            }, g.opts or {})
            vim.api.nvim_create_autocmd(g.event, opts)
        end
    elseif type(group_name) == "number" then
        local opts = vim.tbl_deep_extend("keep", {
            pattern = group_settings.pattern,
            callback = group_settings.callback,
            command = group_settings.command,
        }, group_settings.opts or {})
        vim.api.nvim_create_autocmd(group_settings.event, opts)
    end
end
