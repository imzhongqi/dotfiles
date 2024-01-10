return {
  "kevinhwang91/nvim-ufo",
  event = { "BufRead" },
  dependencies = "kevinhwang91/promise-async",
  keys = function()
    return {
      { "zp", require("ufo").peekFoldedLinesUnderCursor, desc = "Fold Preivew" },
    }
  end,
  opts = {
    provider_selector = function()
      return { "lsp", "indent" }
    end,
  },
}
