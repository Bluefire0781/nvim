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
        ensure_installed = { "lua_ls", "csharp_ls", "html", "ts_ls", "pyright", "cssls", "jdtls", "rust_analyzer" },
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
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- HTML
      vim.lsp.config('html', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- TypeScript / JavaScript
      vim.lsp.config('ts_ls', {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      -- CSS
      vim.lsp.config('cssls', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Python
      vim.lsp.config('pyright', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Java
      vim.lsp.config('jdtls', {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Rust: prefer a Nix-provided rust-analyzer on $PATH (Mason's downloaded
      -- binary doesn't run on NixOS — missing dynamic linker), otherwise fall
      -- back to the one Mason installs so this still works on other machines.
      local function resolve_rust_analyzer()
        local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
        for dir in (vim.env.PATH or ""):gmatch("[^:]+") do
          if dir ~= mason_bin and vim.fn.executable(dir .. "/rust-analyzer") == 1 then
            return { dir .. "/rust-analyzer" }
          end
        end
        return { mason_bin .. "/rust-analyzer" }
      end

      vim.lsp.config('rust_analyzer', {
        cmd = resolve_rust_analyzer(),
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
