local opt = vim.opt -- for conciseness

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.inccommand = "split" -- Open preview window on substitue cdm. :s/
opt.splitbelow = true -- Open split below default is the reverse
opt.splitright = true -- Open split on the right, default is the reverse
opt.formatoptions:remove "o"
opt.signcolumn = "yes"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.wrap = false -- Prevent wrapping when line too long

opt.updatetime = 50

opt.colorcolumn = "80" -- Add line at 80 char

opt.scrolloff = 10 -- When scrolling there will always be 10 line on top or bottom
opt.sidescrolloff = 10 -- ... same but side way

opt.incsearch = true

opt.swapfile = false
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
opt.termguicolors = true

-- Enable cursorline to highlight the current line
opt.cursorline = true
-- vim.api.nvim_command('autocmd CursorHold * :lua vim.lsp.buf.hover()') -- When stoping it will triger hover help

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

-- Make cursor block always... to be more the same as vim
vim.opt.guicursor = "n-v-i-c:block"




local function update_statusline()
    vim.system({"git", "rev-parse", "--abbrev-ref", "HEAD"}, {text = true}, function(res)
        vim.schedule(function()
            local branch = " " .. vim.trim(res.stdout)
            vim.o.statusline = " %F %{&modified?'●':''} " .. branch .. " %= ─ %y ─ at %c ─ %L lines ─ %%%p "
            vim.cmd("redrawstatus")
        end)
    end)
end

vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "ShellCmdPost"}, {
    pattern = "*",
    callback = function()
        local filename = vim.fn.bufname("%")
        local buftype = vim.bo.buftype
        if filename == "" or buftype ~= "" then
            vim.schedule(function()
                vim.opt_local.statusline = " "
            end)
        else
            update_statusline()
        end
    end,
})

-- vim.o.statusline = " %F %{&modified?'●':''} %= ─ %y ─ at %c ─ %L lines ─ %%%p "

-- # vim.o.laststatus = 3
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

if is_windows then
  vim.o.shell = vim.fn.shellescape('C:/Program Files/Git/bin/bash.exe')
  vim.env.PATH = vim.fn.shellescape('C:/Program Files/Git/bin') .. ';' .. vim.env.PATH
  vim.o.shellcmdflag = "-c"
end

-- Change the terminal tab for the current file in nvim
opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'
