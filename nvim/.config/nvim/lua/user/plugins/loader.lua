local loader = {}
local join_paths = require("user.utils.path").join

local root = join_paths(vim.fn.stdpath("data"), "lazy")
local default_install_path = join_paths(root, "lazy.nvim")

local lazy_opts = {
    root = root,
    lockfile = join_paths(vim.fn.stdpath("config"), "lazy-lock.json"),
}

function loader.init(opts)
    opts = opts or {}

    local install_dir = opts.install_path or default_install_path

    if not vim.loop.fs_stat(install_dir) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--branch=stable", -- latest stable release
            "--depth=1",
            "https://github.com/folke/lazy.nvim.git",
            install_dir,
        })
    end

end

function loader.load(config)
    local lazy_available, lazy = pcall(require, "lazy")
    if not lazy_available then
      return
    end

    lazy.setup(config, lazy_opts)
end

return loader