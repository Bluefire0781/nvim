return {
  "github/copilot.vim",
  init = function()
    vim.g.copilot_idle_delay = 600
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-Enter>", 'copilot#Accept("\\<CR>")',
      { silent = true, expr = true, noremap = true, replace_keycodes = false })
  end,
}
