local default_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function check_packer()
    local install_path = vim.g.packer_install_path or default_install_path

    if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
        return true
    end

    print(string.format("Installing packer to `%s`, may take a few minutes, please wait...", install_path))

    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    vim.cmd("packadd packer.nvim")

    return false
end

local function init()
    local installed = check_packer()

    local packer = require("packer")

    packer.init({
        git = {
            depth = 1,
            clone_timeout = 300,
            subcommands = {
                -- this is more efficient than what Packer is using
                fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
            },
        },
        max_jobs = 50,
        display = {
            open_fn = function()
                return require("packer.util").float({
                    border = "rounded",
                })
            end,
        },
    })

    packer.startup(function(use)
        local packages = require("plugins.packages")
        for _, package in ipairs(packages) do
            use(package)
        end
    end)

    if not installed then
        packer.sync()
        return
    end

    require("plugins.settings").setup()
end

init()
