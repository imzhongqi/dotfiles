---@type WeztermConfig
return function(config)
  local util = require("util")
  return util.load(
    {
      "config.appearance",
      "config.keymaps",
    },
    config,
    {
      automatically_reload_config = true,
      audible_bell = "Disabled",
      visual_bell = {
        fade_in_function = "EaseIn",
        fade_in_duration_ms = 150,
        fade_out_function = "EaseOut",
        fade_out_duration_ms = 150,
        target = "CursorColor",
      },

      check_for_updates = true,
      check_for_updates_interval_seconds = 86400,

      -- disable_default_quick_select_patterns = true,
      -- disable_default_mouse_bindings = true,

      exit_behavior = "Close",
      exit_behavior_messaging = "Verbose",
      enable_kitty_keyboard = true,

      -- front_end = "WebGpu",

      initial_rows = 24,
      initial_cols = 120,

      use_ime = true,
      -- ime_preedit_rendering = "Builtin", -- In macOS, ime_preedit_rendering has effected nothing yet. IME preedit is always rendered by WezTerm itself.

      scrollback_lines = 10000,

      native_macos_fullscreen_mode = true,

      -- default_mux_server_domain = "local",
      default_workspace = "Local",
      unix_domains = { { name = "Local" } },
      -- default_gui_startup_args = { "connect", "Local" },
      term = "wezterm", -- wezterm | xterm-256color
    }
  )
end
