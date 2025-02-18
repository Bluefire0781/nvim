-- telescope
vim.keymap.set("n", "<leader>f", "<nop>", { desc = "Telescope" })
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>", { desc = "Git files" })
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>", { desc = "live grep" })
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Old Files" })

--file tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "File Tree" })

--markdown preview
vim.keymap.set("n", "<leader>m", "<nop>", { desc = "Markdown" })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Open" })

--comment toggle
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>", { desc = "Comment" })

--toggle term
vim.keymap.set({ "n", "v" }, "<leader>t", "<nop>", { desc = "Terminal" }, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float Terminal" },
  { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horiz Terminal" },
  { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Verti Terminal" },
  { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>tb", ":ToggleTerm direction=tab<CR>", { desc = "Tab Terminal" },
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", ":ToggleTerm<CR>", { desc = "Close Terminal" }, { noremap = true, silent = true })

--esc to exit terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Insert Mode" })

-- live preview
vim.keymap.set("n", "<leader>lp", ":LivePreview start<CR>", { desc = "LivePreview" })

-- copilot
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Plug>(copilot-complete)', { noremap = true, silent = true })
