---@type wezterm
_G.wezterm = require("wezterm")

return require("config")(wezterm.config_builder and wezterm.config_builder())
