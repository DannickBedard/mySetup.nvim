return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
  },
  config = function()
    require('lualine').setup({

      sections = {
        lualine_c = { "filename", "harpoon2" },
      }
    })
  end
}
