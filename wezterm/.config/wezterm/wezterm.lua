---@type wezterm
_G.wezterm = require("wezterm")

return require("util").load({
  "config",
  "config.font",
  "config.ui",
  "config.keymaps",
  "config.tab_bar",
  "config.statusline",
})
