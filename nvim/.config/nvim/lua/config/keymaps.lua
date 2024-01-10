local keymaps = require("core.keymaps")

keymaps.del({
  { "n", "<leader>K" },
  { "n", { "<leader>fT", "<leader>ft", "<C-/>", "<C-_>" } },
  { "n", { "<C-Up>", "<C-Down>", "<C-Left>", "<C-Right>" } },
  { "t", { "<C-l>" } },
})

keymaps.set({
  { { "n", "i" }, "<D-z>", "<Cmd>undo<CR>" },
  { { "n", "i" }, "<D-Z>", "<Cmd>redo<CR>" },
})
