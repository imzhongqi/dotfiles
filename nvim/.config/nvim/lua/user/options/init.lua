local options = require("user.options.options")

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd[[ colorscheme  gruvbox ]]

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l") -- help whichwrap learn more
