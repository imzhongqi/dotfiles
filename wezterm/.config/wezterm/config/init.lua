---@type WeztermConfig
return {
  use_ime = true,

  enable_kitty_keyboard = true,

  scrollback_lines = 10000,

  native_macos_fullscreen_mode = true,

  default_workspace = "Local",
  unix_domains = {
    { name = "Local" },
  },

  -- default_gui_startup_args = { "connect", "Local" },
}
