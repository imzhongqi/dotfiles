local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
    return
end

lsp_signature.setup({
    floating_window = false,
    hint_enable = true,
    hint_prefix = "",
    -- fix_pos = true,
    transparency = 40,
    max_width = 120,
    padding = " ",
    toggle_key = "<M-p>",
    always_trigger = false,
})
