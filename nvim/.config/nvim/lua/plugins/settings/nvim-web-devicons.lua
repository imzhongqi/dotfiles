local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
    return
end

icons.setup({
    override = {
        Makefile = {
            icon = "",
            color = "#6d8086",
            cterm_color = "66",
            name = "Makefile",
        },
        [".editorconfig"] = {
            icon = "",
            color = "#4e4e4e",
            cterm_color = "239",
            name = "Editorconfig",
        },
        ["go.mod"] = {
            icon = "ﳑ",
            color = "#519aba",
            cterm_color = "67",
            name = "GoMod",
        },
        ["go.sum"] = {
            icon = "ﳑ",
            color = "#519aba",
            cterm_color = "67",
            name = "GoSum",
        },
    },
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true,
})
