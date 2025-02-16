return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'doom',
      config = {
        -- Custom header with ASCII art
        header = {
	  [[			      ]],
	  [[			      ]],
	  [[			      ]],
	  [[			      ]],
	  [[			      ]],
          [[  _   _       _           ]],
          [[ | \ | |     (_)          ]],
          [[ |  \| |_   ___ _ __ ___  ]],
          [[ | . ` \ \ / / | '_ ` _ \ ]],
          [[ | |\  |\ V /| | | | | | |]],
          [[ |_| \_| \_/ |_|_| |_| |_|]],
	  [[			      ]],
	  [[			      ]],
	  [[			      ]],
	  [[			      ]],
	
        },
        -- Center options for actions
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File',
            desc_hl = 'String',
            key = 's',
            keymap = 'SPC f',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Telescope find_files'
          },
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Recent Files',
            desc_hl = 'String',
            key = 'o',
            keymap = 'SPC f',
            key_hl = 'Number',
            key_format = ' %s',
            action = 'Telescope oldfiles'
          },
          {
            icon = ' ',
            icon_hl = "title",
            desc = "New File",
            desc_hl = "String",
            key = "n",
            keymap = "n",
            key_hl = "Number",
            key_format = " %s",
            action = "enew",
          },
        },
        footer = {
           "Neovim Version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
            "Current Time: " .. os.date("%H:%M:%S"),
        },
      }
    })
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
}
