return {
  "is0n/jaq-nvim",
  keys = {
    {
      "<leader>ce",
      "<cmd>Jaq<cr>",
      desc = "run code",
    },
  },
  opts = {
    cmds = {
      -- Uses vim commands
      internal = {
        lua = "luafile %",
        vim = "source %",
      },

      -- Uses shell commands
      external = {
        markdown = "glow %",
        python = "python3 %",
        rust = "cargo run",
        go = "go run %",
        sh = "sh %",
      },
    },

    behavior = {
      -- Default type
      default = "terminal",

      -- Start in insert mode
      startinsert = false,

      -- Use `wincmd p` on startup
      wincmd = false,

      -- Auto-save files
      autosave = true,
    },

    ui = {
      terminal = {
        -- Window position
        position = "bot",

        -- Window size
        size = 10,

        -- Disable line numbers
        line_no = false,
      },
    },
  },
}
