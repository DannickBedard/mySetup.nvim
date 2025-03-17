-- Add this to your vim-customc-cmd.lua file

vim.api.nvim_create_user_command('AddJsonDecodeCoalesceCurrentLine', function()
  -- Get the current line number
  local line_num = vim.api.nvim_win_get_cursor(0)[1]

  -- Get the content of the current line
  local line = vim.api.nvim_buf_get_lines(0, line_num-1, line_num, false)[1]

  -- Process the line using string manipulation (avoids regex issues)
  local new_line = line
  local index = 1

  while true do
    local start_pos = string.find(new_line, "json_decode%(", index)
    if not start_pos then break end

    -- Find the position after the first argument
    local paren_level = 1
    local arg_end = nil
    local pos = start_pos + 11 -- length of "json_decode("

    while pos <= #new_line do
      local char = string.sub(new_line, pos, pos)
      if char == "(" then
        paren_level = paren_level + 1
      elseif char == ")" then
        paren_level = paren_level - 1
        if paren_level == 0 then
          arg_end = pos
          break
        end
      elseif char == "," and paren_level == 1 then
        arg_end = pos
        break
      end
      pos = pos + 1
    end

    if arg_end then
      -- Check if the coalescing operator is already there
      local arg_text = string.sub(new_line, start_pos + 11, arg_end - 1)
      if not string.match(arg_text, "%s*??%s*$") then
        -- Add the operator
        local before = string.sub(new_line, 1, start_pos + 11 + #arg_text)
        local after = string.sub(new_line, arg_end, #new_line)
        new_line = before .. " ?? " .. after
      end
    end

    -- Move to the next position
    index = (arg_end or start_pos) + 1
  end

  -- Update the line if modified
  print("new Line : ")
print(new_line)
  if new_line ~= line then
    vim.api.nvim_buf_set_lines(0, line_num-1, line_num, false, {new_line})
    print("Added coalescing operator to json_decode on current line")
  else
    print("No changes needed on current line")
  end
end, {})

-- Keybinding
vim.keymap.set('n', '<leader>jd', ':AddJsonDecodeCoalesceCurrentLine<CR>', { noremap = true, silent = true, desc = "Add ?? to json_decode in current line" })
