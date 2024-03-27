return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
  },
  config = function()
    require('lualine').setup({

      sections = {
        lualine_a = {'tabs' },
        lualine_c = { "filename",           {
          "harpoon2",
            icon = "󰀱 ",
            indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          }
        },
      },
      tabline = {
        lualine_a = {{'tabs', mode = 2 }},
        lualine_b = {'branch'},
        lualine_c = {'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      }
    })
  end
}
