local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init({
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
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")

	use("folke/which-key.nvim")

	-- Autopairs, integrates with both cmp and treesitter
	use("windwp/nvim-autopairs")

	use("rcarriga/nvim-notify")

	use("nvim-telescope/telescope.nvim")

	-- Comment
	use("numToStr/Comment.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	use("antoinemadec/FixCursorHold.nvim")

	use("ahmedkhalf/project.nvim")

	-- UI
	use("kyazdani42/nvim-web-devicons") --icon
	use("moll/vim-bbye")
	use("akinsho/bufferline.nvim") -- buffer line
	-- use("romgrk/barbar.nvim") -- buffer line bar
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("kyazdani42/nvim-tree.lua")

	-- Color Scheme
	use("lunarvim/darkplus.nvim")
	-- use "morhetz/gruvbox"
	use("luisiacc/gruvbox-baby")

	-- Completion Plugin
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("Pocco81/DAPInstall.nvim")
  use 'leoluz/nvim-dap-go'
	-- use("theHamsta/nvim-dap-virtual-text")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")
end)
