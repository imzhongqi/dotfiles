return {
  "lvimuser/lsp-inlayhints.nvim",
  event = "VeryLazy",
  opts = {
    inlay_hints = {
      parameter_hints = {
        show = true,
        prefix = "󰊕",
        separator = ", ",
        remove_colon_start = true,
        remove_colon_end = true,
      },

      type_hints = {
        show = true,
        prefix = " ",
        separator = ", ",
        remove_colon_start = true,
        remove_colon_end = true,
      },

      labels_separator = "  ",

      highlight = "Comment",
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = "LspAttach_inlayhints",
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
      end,
    })

    require("lsp-inlayhints").setup(opts)
  end,
}
