return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sr', builtin.resume, {}) -- Resume last search
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

      function vim.getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
          return text
        else
          return ''
        end
      end

      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
      vim.keymap.set('v', '<leader>sf', function()
        local text = vim.getVisualSelection()
        builtin.find_files({ default_text = text })
      end, opts)

      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('v', '<leader>fg', function()
        local text = vim.getVisualSelection()
        builtin.live_grep({ default_text = text })
      end, opts)

      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

      vim.keymap.set('n', '<leader>sif', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('v', '<leader>sif', function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({ default_text = text })
      end, opts)

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
