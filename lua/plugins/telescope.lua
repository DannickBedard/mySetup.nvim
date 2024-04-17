return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function ()

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fr', builtin.resume, {}) -- Resume last search
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

      -- ff stand for find file
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('v', '<leader>ff', function()
        local text = vim.getVisualSelection()
        builtin.find_files({ default_text = text })
      end, opts)

      -- fg find global
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('v', '<leader>fg', function()
        local text = vim.getVisualSelection()
        builtin.live_grep({ default_text = text })
      end, opts)

      -- fb find buffer
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

      -- fh find help
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

      -- fif find in file
      vim.keymap.set('n', '<leader>fif', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('v', '<leader>fif', function()
        local text = vim.getVisualSelection()
        builtin.current_buffer_fuzzy_find({ default_text = text })
      end, opts)

      -- Open grep search then output to telescope searching for grep result. Than you can filter by file name
      vim.keymap.set('n', '<leader>gw', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      -- ... but whit uppercase word
      vim.keymap.set('n', '<leader>gW', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)

      -- Find open telescope searching for word under cusor. Than you can filter by file name
      vim.keymap.set('n', '<leader>gs', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

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
