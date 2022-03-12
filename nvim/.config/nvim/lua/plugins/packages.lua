return {
  "wbthomason/packer.nvim",

  "nvim-lua/plenary.nvim",

  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",

  "folke/which-key.nvim",

  -- Autopairs; integrates with both cmp and treesitter
  "windwp/nvim-autopairs",

  "rcarriga/nvim-notify",

  "karb94/neoscroll.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/nvim-treesitter-textobjects",

  "RRethy/vim-illuminate",

  "kyazdani42/nvim-tree.lua",

  -- Very powerful plugin
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-packer.nvim",
  "imzhongqi/telescope-dap.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

  -- Comment
  "numToStr/Comment.nvim",

  -- Terminal
  "akinsho/toggleterm.nvim",

  "antoinemadec/FixCursorHold.nvim",

  -- "ahmedkhalf/project.nvim",

  -- Completion Plugin
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",

  -- Snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/nvim-lsp-installer", -- simple to use language server installer
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  "folke/trouble.nvim",

  -- Debugger
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "Pocco81/DAPInstall.nvim",
  "leoluz/nvim-dap-go",
  "theHamsta/nvim-dap-virtual-text",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- UI
  "kyazdani42/nvim-web-devicons", --icon
  "moll/vim-bbye",
  "akinsho/bufferline.nvim", -- buffer line
  -- ("romgrk/barbar.nvim") -- buffer line bar
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",

  -- Color Scheme
  "lunarvim/darkplus.nvim",
  --  "morhetz/gruvbox"
  "luisiacc/gruvbox-baby",

  "lewis6991/impatient.nvim",

  "editorconfig/editorconfig-vim",

  "chrisbra/Colorizer",
  "norcalli/nvim-colorizer.lua",

  "nvim-lua/lsp-status.nvim",

  {
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
}
