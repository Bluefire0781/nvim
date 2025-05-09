return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"lua", "c_sharp", "javascript", "css", "python", "html"},
      indent = { enabled = true }, -- Enable indentation
      highlight = { enabled = true }, -- Enable syntax highlighting
      sync_install = false, -- Install asynchronously
      textobjects = { enabled = true}, -- Enable text objexts
    })
  end
}
