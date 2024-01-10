local M = {}

---@param opts vim.opt
function M.set(opts)
  for k, v in pairs(opts) do
    vim.opt[k] = v
  end
end

return M
