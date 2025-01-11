-- Paste yank
vim.keymap.set({'n', "v"} , '<leader>p', '"0p', {})
vim.keymap.set({'n', "v"} , '<leader>P', '"0P', {})
vim.keymap.set({'n', "v"} , '<leader>cp', '"+p', {})
vim.keymap.set({'n', "v"} , '<leader>cP', '"+P', {})
vim.keymap.set({'n'} , '<leader>dirp', '"%p', {})
vim.keymap.set({'n'} , '<leader>dirP', '"%P', {})
vim.keymap.set({'n', "v"} , 'yyp', ':co.<CR>', {}) -- Dup line wihout affecting reg

vim.keymap.set('v', '<leader>y', '"+y', {})

vim.keymap.set('n', '<C-d>', '<C-d>zz', {}) -- move half page and center cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz', {}) -- move half page and center cursor
vim.keymap.set('n', 'n', 'nzzzv', {}) -- Next result of search and center
vim.keymap.set('n', 'N', 'Nzzzv', {}) -- Next result of search and center

-- New join binding
vim.keymap.set('n', '<leader>j', 'ddp', {})
vim.keymap.set('n', '<leader>k', 'ddkP', {}) -- Does not work on the bottom of the file...

-- Tabs naviguation
vim.keymap.set({'n', 'v'}, '<leader>tt', ':tabnew %<CR>', {})
vim.keymap.set({'n', 'v'}, '<leader>tn', ':tabn<CR>', {})
vim.keymap.set({'n', 'v'}, '<leader>tp', ':tabp<CR>', {})

-- Quick fix
vim.keymap.set('n', '<leader>q', ':copen<CR>', {})
vim.keymap.set('n', '<leader>Q', ':cclose<CR>', {})
vim.keymap.set('n', '<leader>n', ':cnext<CR>', {})
vim.keymap.set('n', '<leader>N', ':cprev<CR>', {})
vim.keymap.set('n', '<leader>qf', ':cfirt<CR>', {})
vim.keymap.set('n', '<leader>ql', ':clast<CR>', {})

-- Split
vim.keymap.set("n", "<leader>s", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>S", ":split<CR>", {})
vim.keymap.set("v", "<leader>s", ":vsplit<CR>", {})
vim.keymap.set("v", "<leader>S", ":split<CR>", {})

-- other
vim.keymap.set("n", "Q", "<nop>") -- seem like Q goes to dark place

vim.keymap.set({'n', 'v'}, '<leader>B', '<C-V>', {}) -- Enter visual block

-- double quote shurtcut
vim.keymap.set('n', 'ciq', 'ci"', {})
vim.keymap.set('n', 'diq', 'di"', {})
vim.keymap.set('n', 'yiq', 'yi"', {})
vim.keymap.set('n', 'viq', 'vi"', {})
vim.keymap.set('n', 'caq', 'ca"', {})
vim.keymap.set('n', 'daq', 'da"', {})
vim.keymap.set('n', 'yaq', 'ya"', {})
vim.keymap.set('n', 'vaq', 'va"', {})


vim.api.nvim_set_keymap(
    'n',
    '<leader>gbp',
    [[:lua vim.cmd('read !git branch --show-current')<CR>]],
    { noremap = true, silent = true }
)
