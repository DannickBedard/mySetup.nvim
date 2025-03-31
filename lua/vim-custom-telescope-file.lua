local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local flatten = vim.tbl_flatten

-- Custom file finder with double space filtering
return function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
  
  -- Define shortcuts for file patterns
  opts.shortcuts = opts.shortcuts
    or {
      ["l"] = "*.lua",
      ["v"] = "*.vim",
      ["n"] = "*.{vim,lua}",
      ["c"] = "*.c",
      ["r"] = "*.rs",
      ["g"] = "*.go",
    }

  -- Create the custom finder
  local finder = finders.new_job(function(prompt, process_result, process_complete)
    -- Handle empty prompt
    if not prompt or prompt == "" then
      local find_cmd = {"find", ".", "-type", "f"}
      if vim.fn.executable("fd") == 1 then
        find_cmd = {"fd", "--type", "f", "--color", "never"}
      elseif vim.fn.executable("rg") == 1 then
        find_cmd = {"rg", "--files", "--color", "never"}
      end
      
      return vim.fn.jobstart(
        find_cmd,
        {
          cwd = opts.cwd,
          on_stdout = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then
                  process_result(line)
                end
              end
            end
          end,
          on_exit = function() process_complete() end
        }
      )
    end
    
    -- Parse the prompt
    local prompt_parts = vim.split(prompt, "  ")
    local file_pattern = prompt_parts[1]
    local grep_pattern = prompt_parts[2]
    
    -- Prepare file finding command
    local cmd = {}
    
    -- Handle file pattern (first part)
    if vim.fn.executable("rg") == 1 then
      cmd = {"rg", "--files", "--color", "never"}
      if file_pattern and file_pattern ~= "" then
        -- Apply shortcut if it exists
        local pattern = file_pattern
        if opts.shortcuts[file_pattern] then
          pattern = opts.shortcuts[file_pattern]
        end
        
        table.insert(cmd, "-g")
        table.insert(cmd, pattern)
      end
    elseif vim.fn.executable("fd") == 1 then
      cmd = {"fd", "--type", "f", "--color", "never"}
      if file_pattern and file_pattern ~= "" then
        -- Apply shortcut if it exists
        local pattern = file_pattern
        if opts.shortcuts[file_pattern] then
          pattern = opts.shortcuts[file_pattern]
        end
        
        table.insert(cmd, "--glob")
        table.insert(cmd, pattern)
      end
    else
      cmd = {"find", ".", "-type", "f"}
      if file_pattern and file_pattern ~= "" then
        -- Apply shortcut if it exists
        local pattern = file_pattern
        if opts.shortcuts[file_pattern] then
          pattern = opts.shortcuts[file_pattern]
        end
        
        table.insert(cmd, "-name")
        table.insert(cmd, pattern)
      end
    end
    
    local job_id = nil
    
    -- If grep pattern exists, we'll process file results through grep
    if grep_pattern and grep_pattern ~= "" then
      job_id = vim.fn.jobstart(
        cmd,
        {
          cwd = opts.cwd,
          on_stdout = function(_, data)
            if not data then return end
            
            for _, file in ipairs(data) do
              if file ~= "" then
                -- For each file, check if it contains grep_pattern
                local grep_cmd = {"grep", "-l", "-i", grep_pattern, file}
                local grep_output = vim.fn.system(table.concat(grep_cmd, " "))
                
                if grep_output ~= "" then
                  process_result(file)
                end
              end
            end
          end,
          on_exit = function() process_complete() end
        }
      )
    else
      -- No grep pattern, just return file results
      job_id = vim.fn.jobstart(
        cmd,
        {
          cwd = opts.cwd,
          on_stdout = function(_, data)
            if data then
              for _, line in ipairs(data) do
                if line ~= "" then
                  process_result(line)
                end
              end
            end
          end,
          on_exit = function() process_complete() end
        }
      )
    end
    
    -- Return function to stop the job
    return function()
      if job_id then
        vim.fn.jobstop(job_id)
      end
    end
  end, opts.entry_maker or make_entry.gen_from_file(opts))

  -- Create and start the picker
  pickers.new(opts, {
    prompt_title = "Files with Filters",
    finder = finder,
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      -- Call the default mappings
      return true
    end,
  }):find()
end
