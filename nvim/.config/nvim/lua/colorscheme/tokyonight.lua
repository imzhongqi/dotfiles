vim.g.tokyonight_colors = {
    hint = "orange",
    error = "#ff0000",
}

vim.defer_fn(function()
    vim.cmd([[
      highlight! link TsInclude Statement
      highlight! link Keyword Statement
    ]])
end, 0)
