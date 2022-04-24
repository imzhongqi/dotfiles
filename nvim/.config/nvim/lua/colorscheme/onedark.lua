local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

onedark.setup({
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    colors = {
        hint = "orange0",
        error = "#ff0000",
    },
    keyword_style = "bold",
    overrides = function(_)
        return {
            TSInclude = {
                style = "bold",
            },
            TSConditional = {
                style = "bold",
            },
            LspReferenceText = {
                bg = "#41464f",
            }
        }
    end,
})
