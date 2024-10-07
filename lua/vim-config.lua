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

vim.opt.wrap = false



opt.updatetime = 50

opt.colorcolumn = "80"

opt.scrolloff = 10 -- When scrolling there will always be 8 line on top or bottom
opt.sidescrolloff = 10
vim.opt.incsearch = true

vim.opt.swapfile = false
-- à voir si c'est pertinent -- vim.opt.backup = false
-- à voir si c'est pertinent --vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- à voir si c'est pertinent --vim.opt.undofile = true

-- LineNumberColore
vim.api.nvim_set_hl(0, 'LineNrAbove', { bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { bold=true })
  -- Does not seem to work ... : 
vim.api.nvim_set_hl(0, 'LineNr', { fg='White', bold=true })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg='#3e3f40' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg='#3e3f40' })


-- Enable true colors
vim.opt.termguicolors = true

-- Enable cursorline to highlight the current line
vim.opt.cursorline = true
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



vim.opt.guicursor = "n-v-i-c:block"
