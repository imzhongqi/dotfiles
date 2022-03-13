local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

vim.notify = notify

notify.setup {}

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end
telescope.load_extension "notify"