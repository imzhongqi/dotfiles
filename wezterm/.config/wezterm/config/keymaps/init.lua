local util = require("util")

local keys = {}

local function load_keymaps(...)
  for _, modname in ipairs({ ... }) do
    local keymaps = require(modname)
    if util.is_list(keymaps) then
      util.extend(keys, keymaps)
    else
      table.insert(keys, keymaps)
    end
  end
end

local init = util.once(function()
  local modnames = {}

  for _, f in ipairs(wezterm.glob("**/keymaps/*.lua", wezterm.config_dir)) do
    local modname = f:gsub("/", "."):gsub("%.lua$", "")
    if not modname:match("init$") then
      table.insert(modnames, modname)
    end
  end

  load_keymaps(modnames)
end)

return function()
  -- init()
  load_keymaps("config.keymaps.default")

  return {
    leader = { key = "z", mods = "CTRL", timeout_milliseconds = 2000 },
    keys = keys,
    -- disable_default_key_bindings = true,
  }
end
