vim.opt.encoding = "utf-8"     -- set encoding
vim.opt.nu = true              -- enable line numbers
vim.opt.relativenumber = false -- relative line numbers

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.autoindent = true    -- auto indentation
vim.opt.list = true          -- show tab characters and trailing whitespace

vim.opt.ignorecase = true    -- ignore case when searching
vim.opt.smartcase = true     -- unless capital letter in search

vim.opt.hlsearch = false     -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true     -- incrementally highlight searches as you type

vim.opt.termguicolors = true -- enable true color support

vim.opt.scrolloff = 8        -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8    --minimum number of columns to keep above and below the cursor

-- Load pywal colorscheme and setup
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_set_hl(0, "String", { fg = "#03720a" })                 -- green
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", italic = true }) -- gray
vim.api.nvim_set_hl(0, "Keyword", { fg = "#ff0000", bold = true })   -- red
vim.api.nvim_set_hl(0, "Function", { fg = "#c94312", bold = true })  -- blue
vim.api.nvim_set_hl(0, "Type", { fg = "#b2a40c", bold = true })      -- magenta
vim.api.nvim_set_hl(0, "Number", { fg = "#ffa500" })                 -- orange
vim.api.nvim_set_hl(0, "Boolean", { fg = "#12c0c9", bold = true })   -- magenta


-- Setup bufferline plugin
require('bufferline').setup {}

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.py",
--   callback = function()
--     vim.opt.textwidth = 79
--     --vim.opt.colorcolumn = "79"
--   end
-- }) -- python formatting
--
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = { "*.js", "*.html", "*.css", "*.lua" },
--   callback = function()
--     vim.opt.tabstop = 2
--     vim.opt.softtabstop = 2
--     vim.opt.shiftwidth = 2
--   end
-- }) -- javascript formatting
--
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = "*",
--   callback = function()
--     if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
--       vim.cmd("normal! g`\"")
--     end
--   end
-- }) -- return to last edit position when opening files
