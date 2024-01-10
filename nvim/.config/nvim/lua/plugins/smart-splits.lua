return {
  "mrjones2014/smart-splits.nvim",
  dependencies = {
    {
      "kwkarlwang/bufresize.nvim",
      opts = {},
    },
  },
  keys = function()
    return {
      { "<leader>ux", require("smart-splits").start_resize_mode, desc = "Start Resize Mode", mode = { "n" } },

      { "<C-h>", require("smart-splits").move_cursor_left, desc = "Move cursor to left", mode = { "n" } },
      { "<C-j>", require("smart-splits").move_cursor_down, desc = "Move cursor to down", mode = { "n" } },
      { "<C-k>", require("smart-splits").move_cursor_up, desc = "Move cursor to up", mode = { "n" } },
      { "<C-l>", require("smart-splits").move_cursor_right, desc = "Move cursor to right", mode = { "n" } },

      { "<A-h>", require("smart-splits").resize_left, desc = "Resize left", mode = { "n" } },
      { "<A-j>", require("smart-splits").resize_down, desc = "Resize down", mode = { "n" } },
      { "<A-k>", require("smart-splits").resize_up, desc = "Resize up", mode = { "n" } },
      { "<A-l>", require("smart-splits").resize_right, desc = "Resize right", mode = { "n" } },

      { "<leader>bsh", require("smart-splits").swap_buf_left, desc = "Move buffer to left", mode = { "n" } },
      { "<leader>bsj", require("smart-splits").swap_buf_down, desc = "Move buffer to down", mode = { "n" } },
      { "<leader>bsk", require("smart-splits").swap_buf_up, desc = "Move buffer to up", mode = { "n" } },
      { "<leader>bsl", require("smart-splits").swap_buf_right, desc = "Move buffer to right", mode = { "n" } },
    }
  end,
  opts = function()
    return {
      resize_mode = {
        silent = true,
        hooks = {
          on_leave = require("bufresize").register,
        },
      },
    }
  end,
}
