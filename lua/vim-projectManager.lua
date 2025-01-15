vim.keymap.set({'n', 'v'}, '<leader>tt', ':tabnew %<CR>', {})

-- vim.keymap.set("n", "<leader>op", ":vsplit<CR> :lcd ~/Documents/Notes", {})

vim.keymap.set("n", "<leader>top", function()
 local dir = "~/Documents/Notes"
  local files = vim.fn.globpath(dir, "*", false, true) -- Get a list of files in the directory

  if #files > 0 then
    vim.cmd("tabnew")              -- Open a vertical split
    -- vim.cmd("wincmd l")            -- Move to the newly created split
    vim.cmd("lcd " .. dir)         -- Set the local working directory for the new split
    vim.cmd("edit " .. "Index.md")
  else
    vim.notify("No files found in " .. dir, vim.log.levels.WARN)
  end
end, { desc = "Open the first file in ~/Documents/Notes in a split" })

vim.keymap.set("n", "<leader>op", function()
 local dir = "~/Documents/Notes"
  local files = vim.fn.globpath(dir, "*", false, true) -- Get a list of files in the directory

  if #files > 0 then
    vim.cmd("vsplit")              -- Open a vertical split
    vim.cmd("wincmd l")            -- Move to the newly created split
    vim.cmd("lcd " .. dir)         -- Set the local working directory for the new split
    vim.cmd("edit " .. "Index.md")
  else
    vim.notify("No files found in " .. dir, vim.log.levels.WARN)
  end
end, { desc = "Open the first file in ~/Documents/Notes in a split" })



