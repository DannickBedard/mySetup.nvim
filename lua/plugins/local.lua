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
        open_picker = "<leader>lf",

        -- Action for the picker item
        picker_open_split = "<C-S>",
        picker_open_vsplit = "<C-s>",
        picker_open_tab = "<C-t>",
        picker_open_current_win = "<C-w>",

        -- Open the picker with a action prepend
        -- So on picker selection it will open the project in the actons chosen for the binding
        open_in_split = "<leader>lS",
        open_in_vsplit = "<leader>ls",
        open_in_tab = "<leader>lt",
        open_in_current_win = "<leader>lw",
      }

      local loom = require("loom")
      loom.setup({
        keymaps = keymaps,
        projects = projects,
      });

      -- Add current project working dir to the dynamic projects
      vim.keymap.set('n', '<leader>ln', loom.add_project_to_local_storage) -- ln for l -> loom , n -> new project

      -- Open pane listing the dynamic project. In this pane you can edit the dynamic projects (name and path)
      vim.keymap.set('n', '<leader>le', loom.show_projects_pane) -- le for l -> loom, e -> edit
    end
  }
else
  return {}
end
