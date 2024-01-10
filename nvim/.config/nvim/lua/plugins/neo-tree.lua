return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "kwkarlwang/bufresize.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        opts = {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify", "Trouble" },
              buftype = { "terminal", "quickfix" },
            },
          },
          show_prompt = false,
          highlights = {
            statusline = {
              focused = {
                fg = "#c8d3f5",
                bg = "#1e2030",
                bold = true,
              },
              unfocused = {
                fg = "#c8d3f5",
                bg = "#1e2030",
                bold = true,
              },
            },
            -- winbar = {
            --   focused = {
            --     fg = "#c8d3f5",
            --     bg = "#1e2030",
            --     bold = true,
            --   },
            --   unfocused = {
            --     fg = "#c8d3f5",
            --     bg = "#1e2030",
            --     bold = true,
            --   },
            -- },
          },
        },
      },
    },
    opts = {
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "󰈙",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "",
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "",
            renamed = "",
            untracked = "",
            ignored = "◌",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      window = {
        width = 30,
      },

      event_handlers = {
        {
          event = "neo_tree_window_before_open",
          handler = function()
            require("bufresize").block_register()
          end,
        },
        {
          event = "neo_tree_window_after_open",
          handler = function()
            require("bufresize").resize_open()
          end,
        },
        {
          event = "neo_tree_window_before_close",
          handler = function()
            require("bufresize").block_register()
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function()
            require("bufresize").resize_close()
          end,
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window.mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
      }
      return opts
    end,
  },
}
