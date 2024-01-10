local M = {}

function M.del(keymaps)
  for _, entry in ipairs(keymaps) do
    if type(entry) == "table" then
      local modes = type(entry[1]) == "string" and { entry[1] } or entry[1]
      if #modes > 0 then
        local keys = type(entry[2]) == "string" and { entry[2] } or entry[2]
        for _, key in ipairs(keys) do
          vim.keymap.del(modes, key, entry[3])
        end
      end
    end
  end
end

function M.set(keymaps)
  for _, entry in pairs(keymaps) do
    local mode = entry[1]
    local modes = type(mode) == "string" and { mode } or mode

    if #modes > 0 then
      local opts = entry[4] or {}
      opts.silent = opts.silent ~= false
      if opts.remap and not vim.g.vscode then
        opts.remap = nil
      end

      vim.keymap.set(modes, entry[2], entry[3], opts)
    end
  end
end

return M
