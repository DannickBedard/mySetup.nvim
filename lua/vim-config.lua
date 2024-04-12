local opt = vim.opt -- for conciseness

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

vim.opt.wrap = false

vim.g.mapleader = " "


opt.updatetime = 50

opt.colorcolumn = "80"

opt.scrolloff = 8 -- Shen scrolling there will always be 8 line on top or bottom
vim.opt.incsearch = true

vim.opt.swapfile = false
-- à voir si c'est pertinent -- vim.opt.backup = false
-- à voir si c'est pertinent --vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- à voir si c'est pertinent --vim.opt.undofile = true

-- LineNumberColore
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNr', { fg='White', bold=true })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='White', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
