return {
  'stevearc/oil.nvim',
  opts = {},
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
}
