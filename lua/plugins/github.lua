return {
  "github/copilot.vim",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false,
        debounce = 250
      },
      panel = { enabled = false },
    })
  end,
}
