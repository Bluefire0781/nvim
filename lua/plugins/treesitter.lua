return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- main branch does not support lazy-loading
  build = ":TSUpdate",

  config = function()
    -- Needs the tree-sitter CLI (>= 0.26.1) and a C compiler on $PATH.
    -- Already-installed parsers are skipped, so this is cheap on startup.
    require("nvim-treesitter").install({ "lua", "c_sharp", "javascript", "css", "python", "html", "java" })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- pcall: no parser for this filetype -> keep regex highlighting
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
