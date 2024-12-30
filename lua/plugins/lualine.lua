return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
  },
  config = function()
    local leftRounded = ""
    local rightRounded = ""
    local git_blame = require('gitblame')
    require('lualine').setup({
      options = {
        component_separators = "",
        section_separators = { left = rightRounded, right = leftRounded },
        globalstatus = false,
      },
      sections = {
        lualine_a = {{"mode", separator = {right = rightRounded, left = leftRounded}}},
        lualine_z = {{"location", separator = {right = rightRounded, left = leftRounded}}},
        lualine_c = { "filename",
          -- {
          --   "harpoon2",
          --   icon = "󰀱 ",
          --   indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
          --   active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]" },
          --   _separator = " ",
          --   no_harpoon = "Harpoon not loaded",
          -- },
          { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available}
        },
        lualine_x = {'searchcount', 'encoding', 'fileformat', 'filetype'}
      },
      tabline = {
        lualine_a = {{'tabs', mode = 2 }},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {{'branch', separator = {right = rightRounded, left = leftRounded}}},
        lualine_z = {}
      },
      winbar = {
        -- lualine_a = {'filename'},
        lualine_b = {{'filename', path = 3}},
        lualine_c = {},
        lualine_x = {},
        -- lualine_y = {'progress'},
        -- lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_z = {{"location", separator = {right = rightRounded, left = leftRounded}}},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'searchcount', 'encoding', 'fileformat', 'filetype'}
      },
      inactive_winbar = {
        lualine_b = {{'filename', path = 3}},
        lualine_c = {},
        lualine_x = {},
      }
    })
  end
}
