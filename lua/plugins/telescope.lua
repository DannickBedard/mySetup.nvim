return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function ()

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sr', builtin.resume, {}) -- Resume last search
      vim.keymap.set('n', '<leader>sf', builtin.find_files, {}) -- See override bellow. Resume search
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>sif', builtin.current_buffer_fuzzy_find, {})

      -- Does not work with harpoon... 
      -- _last_picker = nil
      -- _last_ctx = nil
      -- local function telescope_middleware(func, ctxfunc)
      --   function inner()
      --     if ctxfunc == nil then
      --       ctx = nil
      --     else
      --       ctx = ctxfunc()
      --     end
      --     if func == _last_picker and vim.deep_equal(ctx, _last_ctx) then
      --       builtin.resume()
      --     else
      --       _last_picker = func
      --       _last_ctx = ctx
      --       func()
      --     end
      --   end
      --   return inner
      -- end
      -- vim.keymap.set('n', '<leader>sf', telescope_middleware(builtin.find_files), {})
      -- vim.keymap.set('n', '<leader>fg', telescope_middleware(builtin.live_grep), {})

    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
