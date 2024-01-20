---@type WeztermConfig
return {
  font_size = 15,
  line_height = 1.4,

  underline_position = -8,
  underline_thickness = 4,

  font = wezterm.font_with_fallback({
    {
      family = "Comic Code Ligatures", --[[ weight = "DemiBold" ]]
    },
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
