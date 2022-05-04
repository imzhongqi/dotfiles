local M = {}

function M.setup()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 300
    vim.g.blamer_show_in_visual_modes = 0
    vim.g.blamer_show_in_insert_modes = 0

    vim.g.blamer_relative_time = 1

    -- Available options: <author>, <author-mail>, <author-time>, <committer>, <committer-mail>, <committer-time>, <summary>, <commit-short>, <commit-long>.
    vim.g.blamer_template = "<author>, <author-time> • <summary>"
    vim.g.blamer_date_format = "%Y/%m/%d/ %H:%M"
end

return M
