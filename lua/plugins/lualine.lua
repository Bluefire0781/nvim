return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- custom lsp status functions
    local function lsp_status()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #clients == 0 then
        return "No LSP"
      end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ", ") -- Show all active LSPs
    end


    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'fluoromachine', -- You can change this to another theme (e.g., 'dracula', 'onedark', etc.)
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree', 'packer' }, -- Disable lualine for specific filetypes
      },
      sections = {
        lualine_a = { 'mode' }, -- Shows current mode (e.g., NORMAL, INSERT)
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          { 'filename', path = 1 }, -- Show full file path
          { lsp_status, icon = "", color = { fg = "#98be65", gui = "bold" } },}, --lsp status
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' }, -- Show progress (percentage through file)
        lualine_z = { 'location' }, -- Show line and column number
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {}, -- Add custom tabline configuration here, if needed
      extensions = { 'nvim-tree', 'fugitive' } -- Add extensions for plugins
    }
  end
}
