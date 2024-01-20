---@type WeztermConfig
return {
  automatically_reload_config = true,

  check_for_updates = true,
  check_for_updates_interval_seconds = 86400,

  disable_default_quick_select_patterns = false,
  disable_default_mouse_bindings = false,

  exit_behavior = "CloseOnCleanExit",
  exit_behavior_messaging = "Verbose",
  enable_kitty_keyboard = true,

  initial_rows = 24,
  initial_cols = 120,

  use_ime = true,

  scrollback_lines = 10000,

  native_macos_fullscreen_mode = true,

  -- default_mux_server_domain = "local",
  default_workspace = "Local",
  unix_domains = { { name = "Local" } },
  -- default_gui_startup_args = { "connect", "Local" },
  term = "wezterm", -- wezterm | xterm-256color
}
