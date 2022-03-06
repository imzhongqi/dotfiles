local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  return
end

dapui.setup {
  icons = { expanded = "", collapsed = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },

  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.4, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.2 },
      { id = "stacks", size = 0.1 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },

  tray = {
    elements = {
      { id = "repl", size = 1 },
      -- { id = "watches", size = 0.2 },
    },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },

  floating = {
    max_height = 0.5, -- These can be integers or a float between 0 and 1.
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },

  windows = { indent = 1 },
}

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open "sidebar"
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close "sidebar"
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close "sidebar"
end

vim.cmd [[
  hi link DapUIVariable Normal
  hi DapUIScope guifg=#ffffff
  hi DapUIType guifg=#60878b
  hi link DapUIValue Normal
  hi DapUIModifiedValue guifg=#00F1F5 gui=bold
  hi DapUIDecoration guifg=#fcecc5
  hi DapUIThread guifg=#434649
  hi DapUIStoppedThread guifg=#ffffff
  hi link DapUIFrameName Normal
  hi DapUISource guifg=#106ba3
  hi DapUILineNumber guifg=#949699
  hi DapUIFloatBorder guifg=#ffffff
  hi DapUIWatchesEmpty guifg=#F70067
  hi DapUIWatchesValue guifg=#A9FF68
  hi DapUIWatchesError guifg=#F70067
  hi DapUIBreakpointsPath guifg=#ffffff
  hi DapUIBreakpointsInfo guifg=#949699
  hi DapUIBreakpointsCurrentLine guifg=#949699 gui=bold
  hi link DapUIBreakpointsLine DapUILineNumber
]]
