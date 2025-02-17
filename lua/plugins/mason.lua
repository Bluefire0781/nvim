return{
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
        ensure_installed = { "lua_ls", "csharp_ls", "html", "ts_ls"}, -- Automatically install these LSPs
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
      lsp.omnisharp.setup({
          cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },
          capabilities = capabilities,
          on_attach = on_attach,
          root_dir = function(fname)
            -- Find the nearest .sln or .csproj, or fallback to the current working directory
            return require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git")(fname) or vim.fn.getcwd()
          end,
      })

      -- html
      lsp.html.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio"},
        capabilities = capabilities,
        on_attach = on_attach,
      })

      --ts/ ls
      lsp.ts_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio"},
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      --css
     lsp.cssls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio"},
        capabilities = capabilities,
        on_attach = on_attach,
     })


    end,
  },

  {
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path", -- Path source for nvim-cmp
      "hrsh7th/cmp-nvim-lua", -- Lua source for nvim-cmp
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
      "hrsh7th/cmp-cmdline",
      -- LSP source for nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Setup for command-line completion with a different format
      cmp.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' }
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = "CMD"
            return vim_item
          end,
        },
      })



      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        --keybinds
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        --sources
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 75 },
          { name = "luasnip", priority = 100, keyword_length = 0 },
          { name = "buffer", priority = 50 },
          { name = "path", priority = 25 },
        }),
        --format
        formatting = {
          format = function(entry, vim_item)
            -- Show the source of the completion item
            vim_item.menu = ({
              nvim_lsp = "[LSPS] ",
              luasnip = "[SNIP] ",
              buffer = "[BUFF] ",
              path = "[PATH] ",
            })[entry.source.name]

            vim_item.menu = vim_item.menu or "" -- Ensure menu is not nil
              local item_kind = vim_item.kind or ""
              if item_kind ~= "" then
                vim_item.menu = vim_item.menu .. " " .. item_kind -- Add space for readability
              end
            return vim_item
          end,
        },
      })
    end,
  },
}

