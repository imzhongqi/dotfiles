return {
  -- { "simrat39/rust-tools.nvim", enabled = false },

  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
    opts = function()
      return {
        tools = {
          hover_actions = {
            replace_builtin_hover = true,
            max_width = 80,
            max_height = 40,
          },
        },
      }
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
}
