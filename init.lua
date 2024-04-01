local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-config")
require("vim-keymaping")

-- Settinge require for project-manage plugin
require("project-manage-config")

require("lazy").setup("plugins")

-- Auto open neotree. Deactive it because anoying i think.
-- vim.cmd(":Neotree filesystem reveal left<CR>")
