---@type WeztermConfig
return {
  color_scheme = "Tokyo Night Moon",

  window_decorations = "RESIZE|INTEGRATED_BUTTONS",
  integrated_title_button_style = "Windows",
  integrated_title_button_alignment = "Left",
  integrated_title_buttons = { "Close", "Hide", "Maximize" },

  command_palette_font_size = 16,
  command_palette_bg_color = "#465779",
  command_palette_fg_color = "#99b3c6",

  window_padding = {
    left = 15,
    right = 0,
    top = 20,
    bottom = 0,
  },

  tab_bar_style = {
    new_tab = " 󰐖",
    new_tab_hover = " 󰐖",

    window_close = wezterm.format({
      { Foreground = { Color = "#ef6c5b" } },
      { Text = "‍‍" },
      "ResetAttributes",
    }),
    window_close_hover = wezterm.format({
      { Foreground = { Color = "#ef6c5b" } },
      { Text = "‍󰅙‍" },
      "ResetAttributes",
    }),

    window_hide = wezterm.format({
      { Foreground = { Color = "#f4c030" } },
      { Text = "‍‍" },
      "ResetAttributes",
    }),
    window_hide_hover = wezterm.format({
      { Foreground = { Color = "#f4c030" } },
      { Text = "‍󰍶‍" },
      "ResetAttributes",
    }),

    window_maximize = wezterm.format({
      { Foreground = { Color = "#56c138" } },
      { Text = "‍ " },
      "ResetAttributes",
    }),
    window_maximize_hover = wezterm.format({
      { Foreground = { Color = "#56c138" } },
      { Text = "‍󰐗 " },
      "ResetAttributes",
    }),
  },
}
