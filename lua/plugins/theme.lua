-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
--   config = function()
--     vim.cmd("colorscheme onedark")
--     vim.api.nvim_create_autocmd("colorscheme", {
--       pattern = "*",
--       callback = function()
--         vim.cmd [[
--        highlight CursorLine guibg=#3c3c3c ctermbg=237
--        ]]
--       end,
--     })
--   end
-- }

return {
  "ellisonleao/gruvbox.nvim", 
  config = function()
    -- require("gruvbox").setup({
    --   terminal_colors = true, -- add neovim terminal colors
    --   undercurl = true,
    --   underline = true,
    --   -- bold = false,
    --   -- italic = {
    --   --   strings = false,
    --   --   emphasis = false,
    --   --   comments = false,
    --   --   operators = false,
    --   --   folds = false,
    --   -- },
    --   strikethrough = true,
    --   invert_selection = false,
    --   invert_signs = false,
    --   invert_tabline = false,
    --   inverse = true, -- invert background for search, diffs, statuslines and errors
    --   contrast = "", -- can be "hard", "soft" or empty string
    --   palette_overrides = {},
    --   overrides = {},
    --   dim_inactive = false,
    --   transparent_mode = false,
    -- })

    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
    vim.api.nvim_create_user_command('ThemeDark', function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end, {})

    vim.api.nvim_create_user_command('ThemeLight', function()
      vim.o.background = "light" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end, {})

  end
}
