return {
  "keaising/im-select.nvim",
  event = "InsertEnter",
  opts = {
    default_im_select = "com.apple.keylayout.US",
    default_command = "/usr/local/bin/im-select",
    set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
    set_previous_events = { "InsertEnter" },
    keep_quiet_on_no_binary = false,
    async_switch_im = true,
  },
  enabled = vim.fn.executable("im-select") == 1,
}
