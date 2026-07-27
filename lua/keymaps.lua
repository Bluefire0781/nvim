-- buffer mappings
vim.keymap.set("n", "<leader>`", "<nop>", { desc = "buffer" })
vim.keymap.set("n", "<leader>`[", ":bn<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>`]", ":bp<cr>", { desc = "prev buffer" })
vim.keymap.set("n", "<leader>``", ":bd<cr>", { desc = "exit buffer" })

-- yank to clipboard mappings
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })

--vsplit
vim.keymap.set("n", "<leader>s", ":vsplit<cr>", { desc = "Split" })
-- save and exit mappings
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save without exit" })
vim.keymap.set("n", "<C-q>", ":q<cr>", { desc = "exit" })

-- telescope
vim.keymap.set("n", "<leader>f", "<nop>", { desc = "Search" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.git_files() end, { desc = "Git files" })
vim.keymap.set("n", "<leader>fz", function() Snacks.picker.grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Old Files" })

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
--vim.api.nvim_set_keymap("n", "<leader>s", ":TransparentToggle<cr>", { desc = "Transparent" })

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

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "<leader>l", "<nop>", vim.tbl_extend("force", opts, { desc = "LSP" }))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto Definition" }))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
        vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
            vim.tbl_extend("force", opts, { desc = "Code Action" }))
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
            vim.tbl_extend("force", opts, { desc = "Line Diagnostics" }))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" }))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
    end,
})
