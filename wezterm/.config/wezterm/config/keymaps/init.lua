local util = require("util")

local act = wezterm.action

local keys = {
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

local init = util.once(function()
  for _, f in ipairs(wezterm.glob(wezterm.config_dir .. "/**/keymaps/*.lua", wezterm.config_dir)) do
    local modname = f:gsub("/", "."):gsub("%.lua$", "")
    if not modname:match("init$") then
      local keymaps = require(modname)
      if util.is_list(keymaps) then
        util.extend(keys, keymaps)
      else
        table.insert(keys, keymaps)
      end
    end
  end
end)

return function(config)
  init()
  config.leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 }
  config.keys = keys
end
