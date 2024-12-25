return   {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        show_hidden_count = true,
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
        },
        never_show = {},
      },
    }

  },
  config = function()
    vim.keymap.set("n", "<leader>ft", ":Neotree filesystem reveal left<CR>", {})
  end,
}
