local act = wezterm.action
local cb = wezterm.action_callback

return {
  key = "w",
  mods = "LEADER|CTRL",
  action = cb(function(window, pane)
    local choices = {}
    local ids = {}
    for i, workspace_name in ipairs(wezterm.mux.get_workspace_names()) do
      local id = tostring(i)
      ids[id] = workspace_name
      table.insert(choices, {
        id = id,
        label = wezterm.format({
          { Foreground = { AnsiColor = "Olive" } },
          { Text = workspace_name },
        }),
      })
    end

    window:perform_action(
      act.InputSelector({
        title = "Workspaces",
        choices = choices,
        fuzzy = true,
        action = wezterm.action_callback(function(window, pane, id, label)
          if id then
            window:perform_action(act.SwitchToWorkspace({ name = ids[id] }), pane)
          end
        end),
      }),
      pane
    )
  end),
}
