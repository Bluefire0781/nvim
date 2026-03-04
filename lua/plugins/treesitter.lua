return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = { "lua", "c_sharp", "javascript", "css", "python", "html" },
      indent = { enable = true },      -- Enable indentation
      highlight = { enable = true },   -- Enable syntax highlighting
      sync_install = false,            -- Install asynchronously
      textobjects = { enable = true }, -- Enable text objexts
    })
  end
}
