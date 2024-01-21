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
  local pad = 2
  return string.format(string.rep(" ", pad) .. "%d: %s" .. string.rep(" ", pad), tab_info.tab_id, title)
end

local function on_format_tab_title(tab, tabs, panes, config, hover, max_width)
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

    { Background = { Color = first and "#222436" or bg } },
    { Foreground = { Color = background } },
    -- { Text = tab.tab_index == 0 and " " or "" },
    -- { Text = tab.tab_index == 0 and " " or "" },
    { Text = first and "" or "" },

    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },

    { Background = { Color = last and "#222436" or bg } },
    { Foreground = { Color = background } },
    -- { Text = "" },
    -- { Text = "" },
    { Text = last and " " or "" },

    "ResetAttributes",
  })
end

return function()
  wezterm.on("format-tab-title", on_format_tab_title)

  return {
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    tab_max_width = 16,
    tab_bar_at_bottom = false,

    colors = {
      tab_bar = {
        background = "#222436",
        new_tab = { bg_color = "#222436", fg_color = "#434C5E" },
        new_tab_hover = { bg_color = "#222436", fg_color = "#8494C4" },
      },
    },

    tab_bar_style = {
      new_tab = " 󰐖",
      new_tab_hover = " 󰐖",

      window_close = wezterm.format({
        { Foreground = { Color = "#ef6c5b" } },
        { Text = "‍ " },
        "ResetAttributes",
      }),
      window_close_hover = wezterm.format({
        { Foreground = { Color = "#ef6c5b" } },
        { Text = "‍󰅙 " },
        "ResetAttributes",
      }),

      window_hide = wezterm.format({
        { Foreground = { Color = "#f4c030" } },
        { Text = "  " },
        "ResetAttributes",
      }),
      window_hide_hover = wezterm.format({
        { Foreground = { Color = "#f4c030" } },
        { Text = " 󰍶 " },
        "ResetAttributes",
      }),

      window_maximize = wezterm.format({
        { Foreground = { Color = "#56c138" } },
        { Text = "  " },
        "ResetAttributes",
      }),
      window_maximize_hover = wezterm.format({
        { Foreground = { Color = "#56c138" } },
        { Text = " 󰐗 " },
        "ResetAttributes",
      }),
    },
  }
end
