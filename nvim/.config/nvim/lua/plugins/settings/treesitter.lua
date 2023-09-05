local M = {}

function M.setup()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup({
        ensure_installed = {
            "vim",
            "go",
            "python",
            "lua",
        },
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = {}, -- List of parsers to ignore installing

        autopairs = {
            enable = true,
        },

        highlight = {
            enable = false, -- false will disable the whole extension
            disable = {}, -- list of language that will be disabled
            additional_vim_regex_highlighting = true,
        },

        indent = {
            enable = true,
            disable = {
                "yaml",
                "go",
            },
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["at"] = "@class.outer",
                    ["it"] = "@class.inner",
                    ["ac"] = "@call.outer",
                    ["ic"] = "@call.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["a/"] = "@comment.outer",
                    ["i/"] = "@comment.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["as"] = "@statement.outer",
                    ["is"] = "@scopename.inner",
                    ["aA"] = "@attribute.outer",
                    ["iA"] = "@attribute.inner",
                    ["aF"] = "@frame.outer",
                    ["iF"] = "@frame.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },

        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

return M
