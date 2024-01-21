local config = {
  color_scheme = "Tokyo Night Moon",
  cursor_thickness = "2.5px",

  command_palette_font_size = 16,
  command_palette_bg_color = "#465779",
  command_palette_fg_color = "#99b3c6",

  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  force_reverse_video_cursor = false,

  window_decorations = "RESIZE|INTEGRATED_BUTTONS", -- RESIZE, INTEGRATED_BUTTONS, NONE
  integrated_title_button_style = "Windows", -- "MacOsNative",
  integrated_title_button_alignment = "Left",
  integrated_title_buttons = { "Close", "Hide", "Maximize" },

  underline_position = -4,
  underline_thickness = 3,

  window_padding = {
    left = 19,
    right = 2,
    top = 20,
    bottom = 0,
  },
}

return function(c)
  local util = require("util")
  ---@type WeztermConfig
  return util.load({
    "config.appearance.font",
    "config.appearance.colors",
    "config.appearance.statusline",
    "config.appearance.tab_bar",
  }, c, config)
end
