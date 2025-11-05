-- Enable true colors early (required for most colorschemes/plugins)
vim.opt.termguicolors = true

-- Load pywal colorscheme and setup
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
--require('pywal').setup()

vim.api.nvim_set_hl(0, "String", { fg = "#03720a" })                 -- green
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true }) -- gray
vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff0000", bold = true })   -- red
vim.api.nvim_set_hl(0, "Function", { fg = "#c94312", bold = true })  -- blue
vim.api.nvim_set_hl(0, "Type", { fg = "#b2a40c", bold = true })      -- magenta
vim.api.nvim_set_hl(0, "Number", { fg = "#ffa500" })                 -- orange
vim.api.nvim_set_hl(0, "Boolean", { fg = "#12c0c9", bold = true })   -- magenta


-- Setup bufferline plugin
require('bufferline').setup {}

-- Custom highlight override for PmenuSel
--vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2a2f4a", fg = "#4d0099", bold = true })
