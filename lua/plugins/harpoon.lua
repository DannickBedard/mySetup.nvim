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
      -- https://github.com/ThePrimeagen/harpoon/pull/400/commits/96fb609c41e6cd4c62d96c96c3689279542994c9
      -- vim.keymap.set("n", "<leader>a1", function() harpoon:list():replace(1) end)
      -- vim.keymap.set("n", "<leader>a2", function() harpoon:list():replace(2) end)
      vim.keymap.set("n", "<leader>d", function() harpoon:list():remove() end)

      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
      vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
      vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
      vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
      vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
      vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

      -- Toggle previous & next buffers stored within Harpoon list
      -- TODO :: Make bette keybinding. CTRL shift pas pour powerschell
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)


      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        local make_finder = function()
          local paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
          end

          return require("telescope.finders").new_table(
            {
              results = paths
            }
          )
        end


        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_buffer_number, map)
            -- Delete selected entry from the list
            map(
              "i",
              "<C-d>", -- your mapping here
              function()
                local state = require("telescope.actions.state")
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_buffer_number)

                harpoon:list():removeAt(selected_entry.index)
                current_picker:refresh(make_finder())
              end
            )

            return true
          end
        }):find()
      end

      vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })

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
