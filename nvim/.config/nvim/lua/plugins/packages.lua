return {
    { "wbthomason/packer.nvim" },

    { "nvim-lua/plenary.nvim" },

    { "lewis6991/impatient.nvim" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },

    { "Darazaki/indent-o-matic" },

    -- Comment
    { "numToStr/Comment.nvim" },

    { "phaazon/hop.nvim", branch = "v1" },

    { "windwp/nvim-autopairs" },
    { "hrsh7th/nvim-cmp" }, -- The completion plugin
    { "hrsh7th/cmp-buffer" }, -- buffer completions
    { "hrsh7th/cmp-path" }, -- path completions
    { "hrsh7th/cmp-cmdline" }, -- cmdline completions
    { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    { "ur4ltz/surround.nvim" },
    { "mrjones2014/smart-splits.nvim" }, 
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({
                default_im_select  = "com.apple.keylayout.US",
                default_command = '/usr/local/bin/im-select',
                set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
                set_previous_events = { "InsertEnter" },
                keep_quiet_on_no_binary = false,
                async_switch_im = true
            })
        end,
    },
}
