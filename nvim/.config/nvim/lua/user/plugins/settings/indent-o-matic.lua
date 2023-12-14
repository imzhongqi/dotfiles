local status_ok, indent = pcall(require, "indent-o-matic")
if not status_ok then
    return
end

indent.setup({
    max_lines = 2048,
    standard_widths = { 2, 4, 8 },
})
