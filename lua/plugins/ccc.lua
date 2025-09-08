return {
  "uga-rosa/ccc.nvim",
  ft = { "css", "scss", "html", "javascript", "typescript", "lua" }, -- only loads for these
  config = function()
    require("ccc").setup({
      highlighter = {
        auto_enable = true, -- auto show highlights on buffer enter
        lsp = f,            -- also highlight colors coming from LSP
      }
    })
  end,
  cmd = { "CccPick" }, -- optional lazy-loading on commands
}
