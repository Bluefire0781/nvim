return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "csharp_ls", "html", "ts_ls", "pyright", "cssls", "jdtls" },
        automatic_installation = false,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      end

      -- Lua
      vim.lsp.config('lua_ls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- C#
      vim.lsp.config('csharp_ls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/csharp-ls" },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- HTML
      vim.lsp.config('html', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- TypeScript / JavaScript
      vim.lsp.config('ts_ls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      -- CSS
      vim.lsp.config('cssls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Python
      vim.lsp.config('pyright', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Java
      vim.lsp.config('jdtls', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Rust (installed via Nix, on $PATH — not managed by Mason)
      vim.lsp.config('rust_analyzer', {
        cmd = { "rust-analyzer" },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              chainingHints = { enable = true },
              closingBraceHints = { enable = true, minLines = 25 },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },
      })

      -- IMPORTANT: vim.lsp.config() only registers configs, it does not
      -- start them. vim.lsp.enable() is what actually tells Neovim to
      -- auto-start these servers when a matching filetype is opened.
      vim.lsp.enable({
        "lua_ls",
        "csharp_ls",
        "html",
        "ts_ls",
        "cssls",
        "pyright",
        "jdtls",
        "rust_analyzer",
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
          keyword_length = 1,
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
