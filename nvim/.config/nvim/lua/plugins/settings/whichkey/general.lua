local which_key = require("plugins.settings.whichkey")

local M = {}

function M.setup()
    -- for telescope find files
    local exclude_patterns = {}
    for i = 1, #vim.g.search_exclude_patterns do
        table.insert(exclude_patterns, i * 2 - 1, "-E")
        table.insert(exclude_patterns, i * 2, vim.g.search_exclude_patterns[i])
    end
    local find_command = vim.list_extend({ "fd", "-H", "-I" }, exclude_patterns) -- use fd command

    which_key.register({
        c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        w = { "<cmd>w!<CR>", "Save" },
        h = { "<cmd>nohlsearch<CR>", "No Highlight" },
        q = { "<cmd>q!<CR>", "Quit" },

        b = {
            name = "Buffers",
            l = {
                "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
                "List buffers",
            },
            c = {
                name = "Close buffers",
                r = {
                    "<cmd>BufferLineCloseRight<CR>",
                    "Close right",
                },
                l = {
                    "<cmd>BufferLineCloseLeft<CR>",
                    "Close left",
                },
            },
        },

        f = {
            name = "Find",
            t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
            f = {
                function()
                    require("telescope.builtin").find_files(
                        vim.tbl_deep_extend(
                            "force",
                            { find_command = find_command },
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    )
                end,
                "Find files",
            },
        },

        p = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            C = { "<cmd>PackerClean<cr>", "Clean" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
            l = { "<cmd>Telescope packer<cr>", "List Installed Plugins" },
        },

        g = {
            name = "Git",
            g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
            j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
            k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
            l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
            p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
            r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
            R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
            s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
            u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
            o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
            d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        },

        l = {
            name = "LSP",
            ["<c-r>"] = { "<cmd>LspRestart<cr>", "Restart Lsp Server" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
            w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
            i = { "<cmd>LspInfo<cr>", "Info" },
            I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
            j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
            k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>", "Quickfix" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        },

        s = {
            name = "Search",
            b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
            c = { "<cmd>FzfLua colorschemes<cr>", "Colorscheme" },
            h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
            M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            R = { "<cmd>Telescope registers<cr>", "Registers" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
            C = { "<cmd>Telescope commands<cr>", "Commands" },
        },

        t = {
            name = "Terminal",
            f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
            h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
            v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
        },

        x = {
            name = "Trouble",
            x = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
            w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics" },
            d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document diagnostics" },
            q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
            l = { "<cmd>TroubleToggle loclist<cr>", "location list" },
        },
    }, {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    })
end

return M
