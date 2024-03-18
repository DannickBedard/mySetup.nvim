-- Paste yank
vim.keymap.set('n', '<leader>p', '"0p', {})
vim.keymap.set('n', '<leader>P', '"0P', {})
vim.keymap.set('v', '<leader>p', '"0p', {})
vim.keymap.set('v', '<leader>P', '"0P', {})


-- Down faster, overrrie join line
vim.keymap.set('n', 'J', '5j', {})
vim.keymap.set('n', 'K', '5k', {})
-- New join binding
vim.keymap.set('n', '<leader>j', 'J', {})
vim.keymap.set('n', '<leader>k', 'K', {})
