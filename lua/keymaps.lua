-- buffer mappings
vim.keymap.set("n", "<leader>`", "<nop>", { desc = "buffer" })
vim.keymap.set("n", "<leader>`[", ":bn<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>`]", ":bp<cr>", { desc = "prev buffer" })
vim.keymap.set("n", "<leader>``", ":bd<cr>", { desc = "exit buffer" })

-- yank to clipboard mappings
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })

-- save and exit mappings
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save without exit" })
vim.keymap.set("n", "<C-q>", ":q<cr>", { desc = "exit" })

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

--Transparent
vim.api.nvim_set_keymap("n", "<leader>s", ":TransparentToggle<cr>", { desc = "Transparent" })

--CCC
vim.api.nvim_set_keymap("n", "<leader>c", "<nop>", { desc = "CCC" })
vim.api.nvim_set_keymap("n", "<leader>cc", ":CccPick<cr>", { desc = "CccPick" })
vim.api.nvim_set_keymap("n", "<leader>ch", ":CccHighlighterToggle<cr>", { desc = "CccToggle" })

--cmdline
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
vim.keymap.set('n', '/', ':SearchBoxIncSearch<CR>', { noremap = true })

--themeselector
vim.api.nvim_set_keymap("n", "<leader>v", "<nop>", { desc = "Visual" })
vim.api.nvim_set_keymap("n", "<leader>vt", ":Themery<cr>", { desc = "Theme", noremap = true, silent = true })
