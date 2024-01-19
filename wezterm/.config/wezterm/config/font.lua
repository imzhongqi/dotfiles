---@type WeztermConfig
return {
  font_size = 15,
  line_height = 1.5,

  font = wezterm.font_with_fallback({
    { family = "Comic Code Ligatures", weight = "DemiBold" },
    { family = "CaskaydiaCove Nerd Font" },
    { family = "PingFang SC" },
  }),

  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font({ family = "Comic Code Ligatures", weight = "Bold" }),
    },
    {
      italic = true,
      font = wezterm.font({ family = "Comic Code Ligatures", italic = true }),
    },
  },
}
