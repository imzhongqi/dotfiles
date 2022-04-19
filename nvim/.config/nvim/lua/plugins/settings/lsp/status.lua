local M = {
    on_attach = function(_) end,
}

local status_ok, lsp_status = pcall(require, "lsp-status")
if status_ok then
    M.on_attach = lsp_status.on_attach
    lsp_status.register_progress()
    lsp_status.config({
        show_file_line = false,
        current_function = false,
        diagnostics = false,
        status_symbol = "",
        select_symbol = function(cursor_pos, symbol)
            if symbol.valueRange then
                local value_range = {
                    ["start"] = {
                        character = 0,
                        line = vim.fn.byte2line(symbol.valueRange[1]),
                    },
                    ["end"] = {
                        character = 0,
                        line = vim.fn.byte2line(symbol.valueRange[2]),
                    },
                }
                return require("lsp-status.util").in_range(cursor_pos, value_range)
            end
        end,
    })
end

return M
