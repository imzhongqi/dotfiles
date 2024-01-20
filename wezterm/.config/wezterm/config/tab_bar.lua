local bg = "#2f3142"
local fg = "#D8DEE9"
local hover_bg = "#434C5E"
local hover_fg = "#D8DEE9"
local active_bg = "#5168ab"
local active_fg = "#D8DEE9"

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title == 0 then
    title = tab_info.active_pane.title
  end

  return string.format("  %d: %s  ", tab_info.tab_id, title)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local foreground = fg
  local background = bg
  if tab.is_active then
    foreground = active_fg
    background = active_bg
  elseif hover then
    foreground = hover_fg
    background = hover_bg
  end

  local first = tab.tab_index == 0
  local last = tab.tab_index == #tabs - 1
  local title = wezterm.truncate_right(tab_title(tab), max_width - (first and 3 or 2))

  return wezterm.format({
    { Attribute = { Intensity = "Bold" } },

    { Background = { Color = first and "none" or bg } },
    { Foreground = { Color = background } },
    -- { Text = tab.tab_index == 0 and " " or "" },
    -- { Text = tab.tab_index == 0 and " " or "" },
    { Text = first and " " or "" },

    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },

    { Background = { Color = last and "none" or bg } },
    { Foreground = { Color = background } },
    -- { Text = "" },
    -- { Text = "" },
    { Text = last and " " or "" },

    "ResetAttributes",
  })
end)

return {
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  tab_max_width = 16,
  tab_bar_at_bottom = false,
}
