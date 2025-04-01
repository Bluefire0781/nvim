return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim", -- Mason LSP bridge
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "csharp_ls", "html", "ts_ls", "pyright" }, -- Automatically install these LSPs
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        -- Enable omnifunc for LSP-based completions
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      --lua
      lsp.lua_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- C#
      lsp.csharp_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/csharp-ls" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- html
      lsp.html.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      --ts/ ls
      lsp.ts_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      --css
      lsp.cssls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      --python
      lsp.pyright.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      --astgrep 
      lsp.ast_grep.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/ast-grep", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",           -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",       -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",         -- Path source for nvim-cmp
      "hrsh7th/cmp-nvim-lua",     -- Lua source for nvim-cmp
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      -- LSP source for nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmd" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        window = {
          completion = { -- rounded border
            border = "rounded",
            scrollbar = "",
          },
          documentation = { -- rounded border
            border = "rounded",
            scrollbar = "", -- other options
          },
        },
      })
    end,
  },
}
