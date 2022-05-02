local status_ok, go = pcall(require, "go")
if not status_ok then
    return
end

go.setup({
    comment_placeholder = "",
    dap_debug = false,
    dap_debug_keymap = false,
})

