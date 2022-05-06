return {
    { "wbthomason/packer.nvim" },

    { "nvim-lua/plenary.nvim" },

    -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/popup.nvim" },

    { "lewis6991/impatient.nvim" },

    -- Autopairs; integrates with both cmp and treesitter
    { "windwp/nvim-autopairs" },
    { "rcarriga/nvim-notify" },
    { "karb94/neoscroll.nvim" },
    { "mrjones2014/smart-splits.nvim" },
    { "folke/which-key.nvim" },

    -- UI
    { "kyazdani42/nvim-web-devicons" }, --icon
    { "moll/vim-bbye" },
    { "akinsho/bufferline.nvim" }, -- buffer line
    -- ("romgrk/barbar.nvim"}) -- buffer line bar
    { "nvim-lualine/lualine.nvim" },
    -- { "lukas-reineke/indent-blankline.nvim" },
    -- { "goolord/alpha-nvim" },
    { "simrat39/symbols-outline.nvim" },
    { "kyazdani42/nvim-tree.lua" },

    -- Color Scheme
    { "lunarvim/darkplus.nvim" },
    { "luisiacc/gruvbox-baby" },
    { "folke/tokyonight.nvim" },
    { "ful1e5/onedark.nvim" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/playground", disable = true }, -- for get the tree sitter parsed tree
    { "p00f/nvim-ts-rainbow" },

    { "RRethy/vim-illuminate" },

    { "editorconfig/editorconfig-vim" },
    { "Darazaki/indent-o-matic" },

    -- Comment
    { "numToStr/Comment.nvim" },

    { "phaazon/hop.nvim", branch = "v1" },

    -- LSP
    { "neovim/nvim-lspconfig" }, -- enable LSP
    { "williamboman/nvim-lsp-installer" }, -- simple to use language server installer
    { "tamago324/nlsp-settings.nvim" }, -- language server settings defined in json for
    { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
    { "folke/trouble.nvim" },
    { "ray-x/go.nvim" },
    { "ray-x/lsp_signature.nvim" },
    { "glepnir/lspsaga.nvim" },
    { "nvim-lua/lsp-status.nvim" },

    -- Completion Plugin
    { "hrsh7th/nvim-cmp" }, -- The completion plugin
    { "hrsh7th/cmp-buffer" }, -- buffer completions
    { "hrsh7th/cmp-path" }, -- path completions
    { "hrsh7th/cmp-cmdline" }, -- cmdline completions
    { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" }, --snippet engine
    { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
    { "b0o/schemastore.nvim" },

    -- Debugger
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "Pocco81/dap-buddy.nvim", branch = "dev" },
    { "leoluz/nvim-dap-go" },
    -- { "theHamsta/nvim-dap-virtual-text" },

    -- Git
    { "lewis6991/gitsigns.nvim" },

    -- Very powerful plugin
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-packer.nvim" },
    { "imzhongqi/telescope-dap.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

    { "ibhagwan/fzf-lua" },

    -- Terminal
    { "akinsho/toggleterm.nvim" },

    { "antoinemadec/FixCursorHold.nvim" },

    -- "ahmedkhalf/project.nvim",
    -- { "chrisbra/Colorizer" },
    -- { "norcalli/nvim-colorizer.lua" },

    -- { "github/copilot.vim" },

    -- { "f3fora/cmp-spell" },
    { "ur4ltz/surround.nvim" },
}
