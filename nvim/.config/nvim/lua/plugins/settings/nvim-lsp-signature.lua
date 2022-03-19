local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

lsp_signature.setup {
  floating_window = true,
  hint_enable = false,
  hint_prefix = "",
  zindex = 9999,
  fix_pos = true,
  transparency = 20,
  max_width = 120,
  padding = " ",
}
