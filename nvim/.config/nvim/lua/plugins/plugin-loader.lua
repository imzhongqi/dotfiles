local M = {}

function M.init()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print "Installing packer..."
    PACKER_BOOTSTRAP = vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd "packadd packer.nvim"
  end

  local _, packer = pcall(require, "packer")

  packer.init {
    git = {
      clone_timeout = 300,
      subcommands = {
        -- this is more efficient than what Packer is using
        fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
      },
    },
    max_jobs = 50,
    display = {
      open_fn = function()
        return require("packer.util").float {
          border = "rounded",
        }
      end,
    },
  }

  packer.startup(function(use)
    packages = require "plugins.packages"
    for _, package in ipairs(packages) do
      use(package)
    end
  end)

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end

return M
