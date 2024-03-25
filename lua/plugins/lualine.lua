return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
  },
  config = function()
    require('lualine').setup({

      sections = {
        lualine_c = { "filename",           {
          "harpoon2",
            icon = "󰀱 ",
            indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
            active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          }
        },
      }
    })
  end
}
