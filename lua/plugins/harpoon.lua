local isLocal = true

if isLocal then
  return {
    dir = vim.fn.expand("~/AppData/Local/nvim-local/harpoon/"),
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()

      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup({
        menu = {
          split = true
        }
      })
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      -- vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)

      for _, idx in ipairs { 1, 2, 3, 4, 5, 6, 7, 8, 9} do
        vim.keymap.set("n", string.format("<space>%d", idx), function()
          harpoon:list():select(idx)
        end)
      end

      -- Open harpoon menu
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      -- vim.keymap.set("n", "<C-e>l", function() harpoon.ui_split:toggle_split(harpoon:list()) end)

      -- local harpoon_extensions = require("harpoon.extensions")
      -- harpoon:extend(harpoon_extensions.highlight_current_file())

    end
  }
else
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
end
