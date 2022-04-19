local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup({})

vim.notify = function(...)
    local level = select(2, ...)
    local level_type = type(level)

    local log_level = (level_type == "number" and level)
        or (level_type == "string" and vim.lsp.log_levels[string.upper(level)])
        or vim.lsp.log_levels["INFO"]
    if log_level >= vim.g.log_level then
        notify(...)
    end
end

local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end
telescope.load_extension("notify")
