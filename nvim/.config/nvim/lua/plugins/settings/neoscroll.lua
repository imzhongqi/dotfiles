local status_ok, scroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

scroll.setup()

require("neoscroll.config").set_mappings({
    ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "160", [['sine']] } },
    ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "160", [['sine']] } },
    -- Use the "circular" easing function
    ["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } },
    ["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } },
    -- Pass "nil" to disable the easing animation (constant scrolling speed)
    ["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } },
    ["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } },
    -- When no easing function is provided the default easing function (in this case "quadratic") will be used
    ["zt"] = { "zt", { "300" } },
    ["zz"] = { "zz", { "300" } },
    ["zb"] = { "zb", { "300" } },
})
