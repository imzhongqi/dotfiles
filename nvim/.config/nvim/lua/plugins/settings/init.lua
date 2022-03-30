local modules = {
  "impatient",

  "nvim-web-devicons",

  "nvim-notify",

  "lsp",

  "dap",

  "nvim-tree",

  "telescope",

  "treesitter",

  "comment",

  "autopairs",

  "gitsigns",

  "alpha",

  "lualine",

  "whichkey",

  -- 上方的类似 tab 的选项卡
  "bufferline",

  -- terminal
  "toggleterm",

  -- 补全
  "completion",

  -- 缩进线
  "indentline",

  -- 诊断
  "trouble",

  -- 滚动条
  "neoscroll",

  -- 高亮当前光标内容
  "illuminate",

  -- "project",

  "toggle-proxy",

  "languages",

  "nvim-hop",

  "nvim-lsp-signature",

  "nvim-lspsaga"
}

for _, module_name in ipairs(modules) do
  local module = "plugins.settings." .. module_name
  local ok, v = pcall(require, module)
  if not ok then
    print(vim.inspect(v))
    vim.notify(string.format("load `%s` module setting failed", module), "warn")
  end
end
