return {
  'smoka7/hop.nvim',
  tag = '*', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { 
      keys = 'etovxqpdygfblzhckisuran',
    }

    -- Lightning motions
    vim.keymap.set('n', '<leader><leader>w', function()  require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, })end , {})
    vim.keymap.set('n', '<leader><leader>b', function()  require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, })end , {})
    vim.keymap.set('n', '<leader><leader>a', function()	require'hop'.hint_words() end , {})
    vim.keymap.set('n', '<leader><leader>j', function()	require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, }) end , {})
    vim.keymap.set('n', '<leader><leader>k', function()	require'hop'.hint_lines({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, }) end , {})

    -- Easymotion like f and F
    vim.keymap.set('n', '<leader><leader>f', function()	 require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })end , {})
    vim.keymap.set('n', '<leader><leader>F', function()	 require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })end , {})
    -- Easymotion like t and T 
    vim.keymap.set('n', '<leader><leader>t', function()	 require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })end , {})
    vim.keymap.set('n', '<leader><leader>T', function()	 require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })end , {})
    -- Search everywhere for char
    vim.keymap.set('n', '<leader><leader>s', function()	 require'hop'.hint_char1({ })end , {})

  end
}
