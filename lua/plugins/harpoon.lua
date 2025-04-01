return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
      vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)

      for _, idx in ipairs { 1, 2, 3, 4, 5, 6, 7, 8, 9} do
        vim.keymap.set("n", string.format("<space>%d", idx), function()
          harpoon:list():select(idx)
        end)
      end

      -- Open harpoon menu
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    end
  },
  {
    "letieu/harpoon-lualine",
     dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  }
}
