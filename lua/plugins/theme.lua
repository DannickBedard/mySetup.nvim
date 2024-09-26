return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    vim.cmd("colorscheme onedark")
    vim.api.nvim_create_autocmd("colorscheme", {
      pattern = "*",
      callback = function()
        vim.cmd [[
      highlight CursorLine guibg=#3c3c3c ctermbg=237
      ]]
      end,
    })
  end
}
