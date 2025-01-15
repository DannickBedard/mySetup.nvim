local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local sorters = require("telescope.config").values.generic_sorter

local projects = {
  { name = "Notes", path = "~/Documents/Notes" },
  { name = "Viridem", path = "c:/viridem" },
  { name = "Nvim", path = "~/AppData/Local/nvim" },
  { name = "Local project", path = "c:/project" },
  { name = "config user", path = "~/" },
}

local function projectPicker(actionWithPath)

  -- Create the picker
  pickers.new({}, {
    prompt_title = "Select a Project",
    finder = finders.new_table({
      results = projects,
      entry_maker = function(item)
        return {
          value = item,
          display = item.name,
          ordinal = item.name,
        }
      end,
    }),
    sorter = sorters({}),
    attach_mappings = function(_, map)
      -- Define what happens on selection
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry(prompt_bufnr)
        local path = vim.fn.expand(selection.value.path)
        actions.close(prompt_bufnr)

        actionWithPath(path)
      end)
      return true
    end,
  }):find()
end

local function open_project_in_new_tab()
  projectPicker(function (path)
    vim.cmd("tabnew")              -- Open a vertical split
    vim.cmd("lcd " .. path)         -- Set the local working directory for the new split
    vim.cmd("edit .")
  end)
end

local function open_project_in_vsplit()
  projectPicker(function (path)
    vim.cmd("vsplit")
    vim.cmd("wincmd l")            -- Move to the newly created split
    vim.cmd("lcd " .. path)
    vim.cmd("edit .") -- Open the file browser in the project directory
  end)
end

vim.keymap.set("n", "<leader>top", function()
  open_project_in_new_tab()
end )

vim.keymap.set("n", "<leader>op", function()
  open_project_in_vsplit();
end )

