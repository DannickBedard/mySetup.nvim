local opt = vim.opt -- for conciseness

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.inccommand = "split"
opt.formatoptions:remove "o"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
-- opt.cursorline = true -- highlight the current cursor line

vim.opt.wrap = false

vim.g.mapleader = " "


opt.updatetime = 50

opt.colorcolumn = "80"

opt.scrolloff = 10 -- Shen scrolling there will always be 8 line on top or bottom
opt.sidescrolloff = 10
vim.opt.incsearch = true

vim.opt.swapfile = false
-- à voir si c'est pertinent -- vim.opt.backup = false
-- à voir si c'est pertinent --vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- à voir si c'est pertinent --vim.opt.undofile = true

-- LineNumberColore
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
  -- Does not seem to work ... : 
vim.api.nvim_set_hl(0, 'LineNr', { fg='White', bold=true })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='White', bold=true })


-- vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover()')

-- Highlight yank selection
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {});

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})
