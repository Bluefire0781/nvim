return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
      views = {
        cmdline_popup = {
          position = { row = "50%", col = "50%" },
          size = { width = 60, height = "auto" },
          border = {
            style = "rounded",
            text = { top = " Command ", top_align = "center" },
          },
          -- Use default highlight groups for a minimal, standard color look
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:Normal",
          },
        },
      },
      presets = {
        bottom_search = false,
        command_palette = false,
      },
    })
  end,
}
