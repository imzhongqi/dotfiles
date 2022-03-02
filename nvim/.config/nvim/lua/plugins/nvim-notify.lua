local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end
vim.notify = notify

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.load_extension "notify"
