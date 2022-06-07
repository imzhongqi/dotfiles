-- local list = {
--   { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
--   { key = "<C-e>",                        action = "edit_in_place" },
--   { key = {"O"},                          action = "edit_no_picker" },
--   { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
--   { key = "<C-v>",                        action = "vsplit" },
--   { key = "<C-x>",                        action = "split" },
--   { key = "<C-t>",                        action = "tabnew" },
--   { key = "<",                            action = "prev_sibling" },
--   { key = ">",                            action = "next_sibling" },
--   { key = "P",                            action = "parent_node" },
--   { key = "<BS>",                         action = "close_node" },
--   { key = "<Tab>",                        action = "preview" },
--   { key = "K",                            action = "first_sibling" },
--   { key = "J",                            action = "last_sibling" },
--   { key = "I",                            action = "toggle_ignored" },
--   { key = "H",                            action = "toggle_dotfiles" },
--   { key = "R",                            action = "refresh" },
--   { key = "a",                            action = "create" },
--   { key = "d",                            action = "remove" },
--   { key = "D",                            action = "trash" },
--   { key = "r",                            action = "rename" },
--   { key = "<C-r>",                        action = "full_rename" },
--   { key = "x",                            action = "cut" },
--   { key = "c",                            action = "copy" },
--   { key = "p",                            action = "paste" },
--   { key = "y",                            action = "copy_name" },
--   { key = "Y",                            action = "copy_path" },
--   { key = "gy",                           action = "copy_absolute_path" },
--   { key = "[c",                           action = "prev_git_item" },
--   { key = "]c",                           action = "next_git_item" },
--   { key = "-",                            action = "dir_up" },
--   { key = "s",                            action = "system_open" },
--   { key = "q",                            action = "close" },
--   { key = "g?",                           action = "toggle_help" },
--   { key = "W",                            action = "collapse_all" },
--   { key = "S",                            action = "search_node" }
-- }

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local function open_in_terminal(node)
    require("toggleterm.terminal").Terminal
        :new({
            dir = node.absolute_path,
        })
        :open()
end

nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                {
                    key = { "l", "<CR>", "o" },
                    cb = tree_cb("edit"),
                },
                {
                    key = "h",
                    cb = tree_cb("close_node"),
                },
                {
                    key = "v",
                    cb = tree_cb("vsplit"),
                },
                {
                    key = "o",
                    action = "open_in_terminal",
                    action_cb = open_in_terminal,
                },
            },
        },
        number = false,
        relativenumber = false,
    },

    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },

    filters = {
        dotfiles = false,
        custom = {
            ".git$",
        },
    },

    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },

    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },

    trash = {
        cmd = [[() {mv -fv "$@" ~/.Trash/}]],
        require_confirm = true,
    },

    renderer = {},

    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                item = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                -- git = {
                --     unstaged = "✗",
                --     staged = "✓",
                --     unmerged = "",
                --     renamed = "➜",
                --     untracked = "★",
                --     deleted = "",
                --     ignored = "◌",
                -- },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
            },
        },

        special_files = {
            ["Makefile"] = false,
        },
    },

    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            git = false,
            profile = false,
        },
    },
})
