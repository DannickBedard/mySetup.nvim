return {
  "coffebar/neovim-project",
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.6" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
  config = function ()
     -- setup neovim-project plugin
    require("neovim-project").setup({
      projects = { -- define project roots
        "~/projects/*",
        -- Config linux
        "~/.config/*",
        -- Config window
        "~/AppData/local/nvim",
        -- Pc home
        "~/Documents/Projet/*",
      },
    })

    vim.keymap.set("n", "<leader>pf", ":Telescope neovim-project discover<CR>", {})
    vim.keymap.set("n", "<leader>ph", ":Telescope neovim-project history<CR>", {})
    vim.keymap.set("n", "<leader>pr", ":NeovimProjectLoadRecent<CR>", {})
    vim.keymap.set("n", "<leader>plh", ":NeovimProjectLoadHist<CR>", {}) -- Not sure of what this do...
    vim.keymap.set("n", "<leader>pl", ":NeovimProjectLoad<CR>", {}) -- Not sure of what this do...
  end
}
