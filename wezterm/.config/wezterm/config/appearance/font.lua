return {
  font_size = 14,
  line_height = 1.6,

  font = wezterm.font_with_fallback({
    { family = "Comic Code Ligatures", weight = "DemiBold" },
    { family = "CaskaydiaCove Nerd Font" },
    { family = "PingFang SC", weight = "DemiBold" },
  }),

  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font({ family = "Comic Code Ligatures", weight = "Bold" }),
    },
    {
      intensity = "Half",
      font = wezterm.font({ family = "Comic Code Ligatures", weight = "DemiBold" }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font({ family = "Comic Code Ligatures", weight = "Bold", italic = true }),
    },
    {
      intensity = "Half",
      italic = true,
      font = wezterm.font({ family = "Comic Code Ligatures", weight = "DemiBold", italic = true }),
    },
  },
}
