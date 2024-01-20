local act = wezterm.action
local cb = wezterm.action_callback

return {
  key = "d",
  mods = "LEADER|CTRL",
  action = cb(function(window, pane)
    local choices = {}
    local ids = {}
    for i, domain in ipairs(wezterm.mux.all_domains()) do
      local id = tostring(i)
      ids[id] = domain:name()
      table.insert(choices, {
        id = id,
        label = wezterm.format({
          { Foreground = { AnsiColor = "Olive" } },
          { Text = domain:name() },
        }),
      })
    end

    window:perform_action(
      act.InputSelector({
        title = "Domains",
        choices = choices,
        fuzzy = true,
        action = wezterm.action_callback(function(window, pane, id, label)
          if id then
            wezterm.log_info(ids[id])
            window:perform_action(act.AttachDomain(ids[id]), pane)
          end
        end),
      }),
      pane
    )
  end),
}
