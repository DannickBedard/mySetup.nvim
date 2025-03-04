local isValid = true

if isValid then

  return {
    dir = vim.fn.expand("~/AppData/Local/nvim-local/loom.nvim/"),
    config = function ()

      local projects = {
        { name = "Notes", path = "~/Documents/Notes" },
        { name = "Viridem", path = "c:/viridem" },
        { name = "Nvim", path = "~/AppData/Local/nvim" },
        { name = "Nvim-local", path = "~/AppData/Local/nvim-local" },
        { name = "Local project", path = "c:/projects" },
        { name = "config user", path = "~/" },
        { name = "Viridem Worktree", path = "~/viridem-worktree" },
      }

      local keymaps = {
        -- Open the project picker without prepend action.
        -- On selection there will be a action list selection
        open_picker = "<leader>opf",

        -- Action for the picker item
        picker_open_split = "<C-S>",
        picker_open_vsplit = "<C-s>",
        picker_open_tab = "<C-t>",
        picker_open_current_win = "<C-w>",

        -- Open the picker with a action prepend
        -- So on picker selection it will open the project in the actons chosen for the binding
        open_in_split = "<leader>opS",
        open_in_vsplit = "<leader>ops",
        open_in_tab = "<leader>opt",
        open_in_current_win = "<leader>opw",
      }

      local loom = require("loom")
      loom.setup({
        keymaps = keymaps,
        projects = projects,
      });

      -- Add current project working dir to the dynamic projects
      vim.keymap.set('n', '<leader>on', loom.add_project_to_local_storage) -- on for o -> loom , n -> new project

      -- Open pane listing the dynamic project. In this pane you can edit the dynamic projects (name and path)
      vim.keymap.set('n', '<leader>oe', loom.show_projects_pane) -- oe for o -> loom, e -> edit
    end
  }
else
  return {}
end
