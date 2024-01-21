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

function string.explode(s, pattern, plain, maxTokens)
  if pattern == "" then
    return false
  end
  local pos = 0
  local arr = {}
  for st, sp in
    function()
      return s:find(pattern, pos, plain)
    end
  do
    table.insert(arr, s:sub(pos, st - 1))
    pos = sp + 1
    if maxTokens ~= nil and maxTokens > 0 then
      maxTokens = maxTokens - 1
      if maxTokens == 0 then
        break
      end
    end
  end
  table.insert(arr, s:sub(pos))
  return arr
end

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

function M.extend(list1, ...)
  assert(type(list1) == "table", string.format("Expected table, got %s", type(list1)))

  for _, list in ipairs({ ... }) do
    for _, v in ipairs(list) do
      table.insert(list1, v)
    end
  end

  return list1
end

function M.once(func)
  local called = false
  return function(...)
    if not called then
      called = true
      return func(...)
    end
  end
end

--- safe load modules and return the wezterm config
---@param modules string|string[]
---@param config table
---@param ... table[]
---@return WeztermConfig
function M.load(modules, config, ...)
  modules = type(modules) == "table" and modules or { modules }
  config = config or {}

  for _, modname in ipairs(modules) do
    local ok, mod = pcall(require, modname)
    if not ok then
      wezterm.log_error(string.format("load: failed to load modules `%s`, error: %s", modname, mod))
    else
      if type(mod) == "function" then
        local ret = mod(config)
        if ret then
          M.merge(config, ret)
        end
      elseif type(mod) == "table" then
        if mod.apply and type(mod.apply) == "function" then
          mod.apply(config)
        else
          M.merge(config, mod)
        end
      end
    end
  end

  for _, c in ipairs({ ... }) do
    M.merge(config, c)
  end

  return config
end

return M
