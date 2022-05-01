local status_ok, fzflua = pcall(require, "fzf-lua")
if not status_ok then
    return
end

local exclude_patterns = {}
for i = 1, #vim.g.search_exclude_patterns do
    table.insert(exclude_patterns, i * 2 - 1, "-E")
    table.insert(exclude_patterns, i * 2, vim.g.search_exclude_patterns[i])
end
local fd_opts = table.concat(vim.list_extend({ "-H", "-I", "--type", "file", "--type", "symlink" }, exclude_patterns), " ")

local actions = require("fzf-lua.actions")

fzflua.setup({
    height = 0.60, -- window height
    width = 0.80, -- window width
    row = 0.32, -- window row position (0=top, 1=bottom)
    col = 0.50, -- window col position (0=left, 1=right)
    files = {
        prompt = "Search Files  ",
        multiprocess = true, -- run command in a separate process
        git_icons = true, -- show git icons?
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        fd_opts = fd_opts,
        previewer = "builtin",
    },
    fzf_opts = {
        ["--ansi"] = "",
        ["--prompt"] = "•",
        ["--pointer"] = "•",
        ["--marker"] = "•",
        ["--info"] = "hidden",
        ["--height"] = "100%",
        ["--layout"] = "reverse",
    },
    grep = {
        prompt = "Rg  ",
        input_prompt = "Grep For  ",
        multiprocess = true, -- run command in a separate process
        git_icons = true, -- show git icons?
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `rg` over `grep`
        -- default options are controlled by 'rg|grep_opts'
        -- cmd            = "rg --vimgrep",
        grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
        -- set to 'true' to always parse globs in both 'grep' and 'live_grep'
        -- search strings will be split using the 'glob_separator' and translated
        -- to '--iglob=' arguments, requires 'rg'
        -- can still be used when 'false' by calling 'live_grep_glob' directly
        rg_glob = false, -- default to glob parsing?
        glob_flag = "--iglob", -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
        -- advanced usage: for custom argument parsing define
        -- 'rg_glob_fn' to return a pair:
        --   first returned argument is the new search query
        --   second returned argument are addtional rg flags
        -- rg_glob_fn = function(opts, query)
        --   ...
        --   return new_query, flags
        -- end,
        actions = {
            -- actions inherit from 'actions.files' and merge
            -- this action toggles between 'grep' and 'live_grep'
            ["ctrl-g"] = { actions.grep_lgrep },
        },
        no_header = false, -- hide grep|cwd header?
        no_header_i = false, -- hide interactive header?
    },
    preview = {
        -- default     = 'bat',           -- override the default previewer?
        -- default uses the 'builtin' previewer
        border = "border", -- border|noborder, applies only to
        -- native fzf previewers (bat/cat/git/etc)
        wrap = "nowrap", -- wrap|nowrap
        hidden = "nohidden", -- hidden|nohidden
        vertical = "down:45%", -- up|down:size
        horizontal = "right:60%", -- right|left:size
        layout = "horizontal", -- horizontal|vertical|flex
        flip_columns = 120, -- #cols to switch to horizontal on flex
        -- Only valid with the builtin previewer:
        title = true, -- preview border title (file/buf)?
        scrollbar = "float", -- `false` or string:'float|border'
        -- float:  in-window floating border
        -- border: in-border chars (see below)
        scrolloff = "-2", -- float scrollbar offset from right
        -- applies only when scrollbar = 'float'
        scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
        -- applies only when scrollbar = 'border'
        delay = 100, -- delay(ms) displaying the preview
        -- prevents lag on fast scrolling
        winopts = { -- builtin previewer window options
            number = true,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = "both",
            cursorcolumn = false,
            signcolumn = "no",
            list = false,
            foldenable = false,
            foldmethod = "manual",
        },
    },
    previewers = {
        -- cat = {
        --     cmd = "cat",
        --     args = "--number",
        -- },
        -- bat = {
        --     cmd = "bat",
        --     args = "--style=numbers,changes --color always",
        --     theme = "Coldark-Dark", -- bat preview theme (bat --list-themes)
        --     config = nil, -- nil uses $BAT_CONFIG_PATH
        -- },
        -- head = {
        --     cmd = "head",
        --     args = nil,
        -- },
        -- git_diff = {
        --     cmd_deleted = "git diff --color HEAD --",
        --     cmd_modified = "git diff --color HEAD",
        --     cmd_untracked = "git diff --color --no-index /dev/null",
        --     -- pager        = "delta",      -- if you have `delta` installed
        -- },
        -- man = {
        --     -- NOTE: remove the `-c` flag when using man-db
        --     cmd = "man -c %s | col -bx",
        -- },
        builtin = {
            syntax = true, -- preview syntax highlight?
            syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
            syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
            limit_b = 1024 * 1024 * 10, -- preview limit (bytes), 0=nolimit
        },
    },
})
