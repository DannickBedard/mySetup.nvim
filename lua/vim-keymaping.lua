-- Paste yank
vim.keymap.set('n', '<leader>p', '"0p', {})
vim.keymap.set('n', '<leader>P', '"0P', {})
vim.keymap.set('n', '<leader>cp', '"+p', {})
vim.keymap.set('n', '<leader>cP', '"+P', {})
vim.keymap.set('n', 'yyp', ':co.<CR>', {}) -- Dup line wihout affecting reg

vim.keymap.set('v', '<leader>p', '"0p', {})
vim.keymap.set('v', '<leader>P', '"0P', {})
vim.keymap.set('v', '<leader>cp', '"+p', {})
vim.keymap.set('v', '<leader>cP', '"+P', {})
vim.keymap.set('v', '<leader>y', '"+y', {})
vim.keymap.set('v', 'yyp', ':co.<CR>', {}) -- Dup line wihout affecting reg


-- Down faster, overrrie join line
vim.keymap.set('n', 'J', '5j', {})
vim.keymap.set('n', 'K', '5k', {})

vim.keymap.set('n', '<C-d>', '<C-d>zz', {}) -- move half page and center cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz', {}) -- move half page and center cursor
vim.keymap.set('n', 'n', 'nzzzv', {}) -- Next result of search and center
vim.keymap.set('n', 'N', 'Nzzzv', {}) -- Next result of search and center


-- New join binding
vim.keymap.set('n', '<leader>j', 'J', {})
vim.keymap.set('n', '<leader>k', 'K', {})

-- Tabs naviguation
vim.keymap.set('n', '<leader><leader>n', ':tabnew %<CR>', {})
vim.keymap.set('n', '<leader>n', ':tabn<CR>', {})
vim.keymap.set('n', '<leader>N', ':tabp<CR>', {})


vim.keymap.set('n', '<leader>B', '<C-V>', {})
vim.keymap.set('v', '<leader>B', '<C-V>', {})
