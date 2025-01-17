-- TODO
-- - [ ] When in telescope, can make keybind to open in tab, split and vsplit and current window...
-- - [ ] Keybind(like juste op, keep the opv, opV, opt, opw) that open telescope chose a project and another prompt to select where to put it...
-- Notes
-- kaymap op stand for open project, the letter after are the mode to enter

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local sorters = require("telescope.config").values.generic_sorter

local projects = {
  { name = "Notes", path = "~/Documents/Notes" },
  { name = "Viridem", path = "c:/viridem" },
  { name = "Nvim", path = "~/AppData/Local/nvim" },
  { name = "Local project", path = "c:/projects" },
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
        local name = vim.fn.expand(selection.value.name)
        actions.close(prompt_bufnr)

        actionWithPath(path, name)
      end)
      return true
    end,
  }):find()
end

local function open_project_in_new_tab()
  projectPicker(function (path, name)
    vim.cmd("tabnew")              -- Open a vertical split
    vim.cmd("lcd " .. path)         -- Set the local working directory for the new split
    vim.cmd("edit .")
    vim.cmd("LualineRenameTab " .. name) -- Rename tab for the current project
  end)
end

local function open_project_in_vsplit()
  projectPicker(function (path, name)
    vim.cmd("vsplit")
    vim.cmd("wincmd l")            -- Move to the newly created split
    vim.cmd("lcd " .. path)
    vim.cmd("edit .") -- Open the file browser in the project directory
  end)
end

local function open_project_in_split()
  projectPicker(function (path, name)
    vim.cmd("split")
    vim.cmd("wincmd l")            -- Move to the newly created split
    vim.cmd("lcd " .. path)
    vim.cmd("edit .") -- Open the file browser in the project directory
  end)
end

local function open_project_in_current_window()
  projectPicker(function (path, name)
    vim.cmd("lcd " .. path)
    vim.cmd("edit .") -- Open the file browser in the project directory
    vim.cmd("LualineRenameTab " .. name) -- Rename tab for the current project
  end)
end

-- Ne marche pas encore... 
local project_states = {}
local function open_project_in_float(path)
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  local width = math.floor(vim.o.columns * 0.8)   -- Set float width to 80% of the window
  local height = math.floor(vim.o.lines * 0.8)    -- Set float height to 80% of the window
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Configure the floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Change the working directory to the project path
  vim.cmd("lcd " .. path)

  -- Restore state if available
  if project_states[path] then
    local state = project_states[path]
    vim.cmd("edit " .. state.file) -- Open the last file
    vim.api.nvim_win_set_cursor(win, state.cursor) -- Restore the cursor position
  else
    vim.cmd("edit .") -- Open the file browser if no state exists
  end

  -- Save state when the buffer is closed
  local function save_project_state()
    if vim.api.nvim_buf_is_valid(buf) then
      local file = vim.api.nvim_buf_get_name(buf)
      local cursor = vim.api.nvim_win_get_cursor(win)
      project_states[path] = { file = file, cursor = cursor } -- Save the state
    end
  end

 -- Attach autocmds to save state on various events
  vim.api.nvim_create_autocmd({ "BufWipeout", "WinClosed", "BufLeave" }, {
    buffer = buf,
    callback = save_project_state,
  })
end

vim.keymap.set("n", "<leader>opt", function()
  open_project_in_new_tab()
end )

vim.keymap.set("n", "<leader>ops", function()
  open_project_in_vsplit();
end )

vim.keymap.set("n", "<leader>opS", function()
  open_project_in_split();
end )

vim.keymap.set("n", "<leader>opw", function()
  open_project_in_current_window();
end )

vim.keymap.set("n", "<leader>opf", function()
  projectPicker(open_project_in_float);
end )

