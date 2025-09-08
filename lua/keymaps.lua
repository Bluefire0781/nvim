-- space bar leader key
vim.g.mapleader = " "

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
