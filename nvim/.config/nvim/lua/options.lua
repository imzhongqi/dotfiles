local options = {
    backup = false, -- creates a backup file
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    hidden = true, -- required to keep multiple buffers and open multiple buffers

    clipboard = "unnamedplus", -- allows neovim to access system clipboard

    fileencoding = "utf-8", -- the encoding written to a file

    ignorecase = true,

    completeopt = { "menuone", "noselect" },

    mouse = "a",

    smarttab = true,
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false,

    timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 300,
    colorcolumn = "120",

    termguicolors = true,
    numberwidth = 4,
    number = true,
    relativenumber = true,
    cursorline = true, -- highlight the current line
    pumheight = 10, -- pop up menu height
    cmdheight = 1, -- more space in neovim command line for displaying messages
    hlsearch = true,
    -- titlestring = "%<%F%=%l/%L - neovim", -- what the title of the window will be set to
    title = true, -- set the title of window to the value of the titlestring
    showtabline = 2, -- always show tabs

    conceallevel = 0, -- so that `` is visible in markdown files

    shiftwidth = 4, -- the number of spaces inserted for each indentation
    -- expandtab = true, -- convert tabs to spaces
    -- tabstop = 4, -- insert 2 spaces for a tab
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time, example: "yes:<column-number>"

    showmode = false,

    -- list = true,
    -- listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,space:·",

    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
    sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.

    -- endofline = false,
    -- fixendofline = false,
    -- binary = true,

    pumblend = 30,
    winblend = 30,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.wo.colorcolumn = "99999"

vim.opt.whichwrap:append("<,>,[,],h,l")

-- set the toggle-proxy
-- vim.g.http_proxy = "http://localhost"
-- vim.g.https_proxy = "http://localhost"

-- set the log level for notify
vim.g.log_level = vim.lsp.log_levels.INFO

if vim.fn.has("nvim-0.7.0") == 1 then
    vim.defer_fn(function()
        vim.opt["laststatus"] = 3
    end, 0)
end
