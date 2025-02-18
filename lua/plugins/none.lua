return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
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
        lua = { 'stylelua' },
        csharp = { 'csharpier' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout = 10000,
      },
      vim.keymap.set({ 'n', 'v' }, '<leader>mf', function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout = 1000,
        })
      end),
      { desc = 'Format file or range (in visual mode)' }
    })
  end,
}
