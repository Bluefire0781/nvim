return{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim", -- Required dependency for UI components
    "rcarriga/nvim-notify", -- Optional, for enhanced notifications
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,       -- Enable the command-line UI
        view = "cmdline_popup", -- Use the popup view for the command line
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%", -- Center vertically
            col = "50%", -- Center horizontally
          },
          size = {
            width = 60, -- Set the popup width
            height = "auto", -- Adjust height automatically
          },
          border = {
            style = "rounded", -- Rounded border style
            text = {
              top = " Command ", -- Text at the top of the popup
              top_align = "center",
            },
          },
        },
      },
      presets = {
        bottom_search = false, -- Disable traditional bottom search
        command_palette = false, -- Disable command palette to keep it simple
      },
    })

  end,
}
