local act = wezterm.action
local cb = wezterm.action_callback

local keymaps = {
  { key = "f", mods = "SUPER|CTRL", action = act.ToggleFullScreen },

  { key = "z", mods = "LEADER|CTRL", action = act.SendKey({ key = "z", mods = "CTRL" }) },
  { key = "t", mods = "LEADER", action = act.SpawnTab("DefaultDomain") },
  { key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },
  { key = "a", mods = "LEADER", action = act.AttachDomain("Local") },
  { key = "n", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
  { key = "p", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },

  {
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
          title = "Workspace",
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
  },

  {
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
          title = "Workspace",
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
  },
}

return function(config)
  config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 }
  config.keys = keymaps
end
