local wezterm = require("wezterm")

local M = {}

-- Fast implementation to check if a table is a list
---@param t table
function M.is_list(t)
  local i = 0
  ---@diagnostic disable-next-line: no-unknown
  for _ in pairs(t) do
    i = i + 1
    if t[i] == nil then
      return false
    end
  end
  return true
end

--- Checks if a table is empty.
---
---@see https://github.com/premake/premake-core/blob/master/src/base/table.lua
---
---@param t table Table to check
---@return boolean `true` if `t` is empty
function M.tbl_isempty(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))
  return next(t) == nil
end

local function can_merge(v)
  return type(v) == "table" and (M.tbl_isempty(v) or not M.is_list(v))
end

--- Merges the values similar to vim.tbl_deep_extend with the **force** behavior,
--- but the values can be any type, in which case they override the values on the left.
--- Values will me merged in-place in the first left-most table. If you want the result to be in
--- a new table, then simply pass an empty table as the first argument `vim.merge({}, ...)`
--- Supports clearing values by setting a key to `vim.NIL`
---@generic T
---@param ... T
---@return T
function M.merge(...)
  local ret = select(1, ...)
  for i = 2, select("#", ...) do
    local value = select(i, ...)
    if can_merge(ret) and can_merge(value) then
      for k, v in pairs(value) do
        ret[k] = M.merge(ret[k], v)
      end
    elseif value ~= nil then
      ret = value
    end
  end
  return ret
end

--- safe load modules and return the wezterm config
---@param modules string[]
---@param ... table[]
---@return WeztermConfig
function M.load(modules, ...)
  local config = {}
  if wezterm.config_builder then
    config = wezterm.config_builder()
  end

  for _, modname in ipairs(modules) do
    local ok, mod = pcall(require, modname)
    if not ok then
      wezterm.log_error(string.format("load: failed to load modules, error: %s", mod))
    end

    if ok and mod then
      if type(mod) == "function" then
        mod(config)
      elseif type(mod) == "table" then
        M.merge(config, mod)
      end
    end
  end

  for _, c in ipairs({ ... }) do
    M.merge(config, c)
  end

  return config
end

return M
