vim.cmd.colorscheme("kanagawa")

vim.opt.termguicolors = true   -- bufferline
require("bufferline").setup {} -- bufferline

-- Transparent plugin setup
require("transparent").setup({
  -- Default groups to apply transparency
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  -- Additional groups to clear (if any)
  extra_groups = {},
  -- Groups to exclude from clearing
  exclude_groups = {},
  -- Code to execute after groups are cleared
  on_clear = function() end,
})

-- Remove transparency for specific plugin prefixes
local transparent = require("transparent")
for _, name in ipairs({ "WhichKey", "noice", "lualine", "Pmenu", "bufferline", "Mason", "Lazy" }) do
  transparent.clear_prefix(name)
end

-- Custom highlight settings for PmenuSel
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2f4a", fg = "#4d0099", bold = true })
