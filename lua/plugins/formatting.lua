return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- Trigger on save
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
        markdown = { 'prettier' },
        csharp = { 'csharpier' },
        python = { 'isort', 'black' },
      },
      format_after_save = {
        lsp_fallback = true,
        async = true,   -- Enable async formatting
        timeout = 3000, -- Reduced timeout for faster feedback
      },
      vim.keymap.set({ 'n', 'v' }, '<leader>mf', function()
        conform.format({
          lsp_fallback = true,
          async = true,   -- Async formatting in keymap as well
          timeout = 1000, -- Short timeout for quick formatting
        })
      end, { desc = 'Format file or range (in visual mode)' })
    })
  end,
}
