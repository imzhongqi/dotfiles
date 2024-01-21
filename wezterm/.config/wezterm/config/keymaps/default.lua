local act = wezterm.action

return {
  { key = "p", mods = "SUPER|SHIFT", action = act.ActivateCommandPalette },
  { key = "l", mods = "SUPER|SHIFT", action = act.ShowDebugOverlay },
  { key = "f", mods = "SUPER|CTRL", action = act.ToggleFullScreen },

  { key = "r", mods = "LEADER|CTRL", action = act.ReloadConfiguration },
  { key = "z", mods = "LEADER|CTRL", action = act.SendKey({ key = "z", mods = "CTRL" }) },
  { key = "t", mods = "LEADER", action = act.SpawnTab("DefaultDomain") },
  { key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },
  { key = "a", mods = "LEADER", action = act.AttachDomain("Local") },
  { key = "n", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
  { key = "p", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
  { key = "\\", mods = "LEADER", action = act.SplitHorizontal },
  { key = "-", mods = "LEADER", action = act.SplitVertical },
}
