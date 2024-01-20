---@type wezterm
_G.wezterm = require("wezterm")

local config = require("util").load({
  "config",
  "config.colors",
  "config.font",
  "config.ui",
  "config.keymaps",
  "config.statusline",
  "config.tab_bar",
}, wezterm.config_builder and wezterm.config_builder() or {})

return config
