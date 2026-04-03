return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "kkharji/sqlite.lua", -- ✅ required for frecency
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          dynamic_preview_title = true,

          layout_config = {
            horizontal = { height = 0.99, width = 0.99 },
          },

          cache_picker = { num_pickers = 100, limit_entries = 1000 },

          file_ignore_patterns = {
            "rockyou%.txt",
            "%.min%.js",
          },

          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob=!rockyou.txt", -- will ignore password files
          },
        },

        -- ✅ 🔥 FRECENCY CONFIG (THIS WAS MISSING)
        extensions = {
          frecency = {
            show_scores = true,
            show_unindexed = true,

          },

          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })

      -- ✅ Load extensions ONCE
      telescope.load_extension("frecency")
      telescope.load_extension("ui-select")

      ------------------------------------------------------------------
      -- HELPERS
      ------------------------------------------------------------------

      function vim.getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg("v")
        vim.fn.setreg("v", {})
        return text:gsub("\n", "")
      end

      local opts = { noremap = true, silent = true }
      local allFileArgs = function()
        return { "--hidden", "--no-ignore" }
      end

      ------------------------------------------------------------------
      -- BASIC
      ------------------------------------------------------------------

      vim.keymap.set("n", "<leader>fr", builtin.resume)
      vim.keymap.set("n", "<leader>fp", builtin.pickers)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)

      ------------------------------------------------------------------
      -- FILES
      ------------------------------------------------------------------

      vim.keymap.set("n", "<leader>ff", builtin.find_files)

      vim.keymap.set("v", "<leader>ff", function()
        builtin.find_files({ default_text = vim.getVisualSelection() })
      end, opts)

      -- find with hidden files
      vim.keymap.set("n", "<leader>fhf", function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
        })
      end, opts)

      vim.keymap.set("n", "<space>fn", function()
        builtin.find_files({ cwd = "~/Documents/Notes" })
      end)

      ------------------------------------------------------------------
      -- 🔥 FRECENCY (NEW)
      ------------------------------------------------------------------

      vim.keymap.set("n", "<leader>fo", telescope.extensions.frecency.frecency)

      ------------------------------------------------------------------
      -- CUSTOM PICKERS (kept)
      ------------------------------------------------------------------

      local customTelescopeGrep = require("vim-custom-telescope-grep")
      local customTelescopeFile = require("vim-custom-telescope-file")
      local customTelescopeRipgrepRaw = require("vim-custom-telescope-ripgrep-raw")

      vim.keymap.set("n", "<leader>tff", customTelescopeFile) -- not really using... # does not work i think

      vim.keymap.set("n", "<leader>fg", customTelescopeGrep)
      vim.keymap.set("v", "<leader>fg", function()
        customTelescopeGrep({ default_text = vim.getVisualSelection() })
      end, opts)

      vim.keymap.set("n", "<leader>rg", customTelescopeRipgrepRaw)
      vim.keymap.set("v", "<leader>rg", function()
        customTelescopeRipgrepRaw({
          default_text = vim.getVisualSelection(),
        })
      end, opts)

      ------------------------------------------------------------------
      -- GREP
      ------------------------------------------------------------------

      vim.keymap.set("n", "<leader>fhg", function()
        builtin.live_grep({
          hidden = true,
          additional_args = allFileArgs,
        })
      end, opts)

      vim.keymap.set("v", "<leader>fhg", function()
        builtin.live_grep({
          hidden = true,
          default_text = vim.getVisualSelection(),
          additional_args = allFileArgs,
        })
      end, opts)

      ------------------------------------------------------------------
      -- SEARCH WORD - Then search by file name
      ------------------------------------------------------------------

      vim.keymap.set("n", "<leader>fw", function()
        builtin.grep_string({ search = vim.fn.expand("<cword>") })
      end)

      vim.keymap.set("n", "<leader>fW", function()
        builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
      end)

      vim.keymap.set("n", "<leader>fs", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)

      ------------------------------------------------------------------
      -- MISC
      ------------------------------------------------------------------

      -- vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
      vim.keymap.set("n", "<leader>fm", builtin.marks)

      vim.keymap.set("n", "<leader>fq", builtin.quickfix)
      vim.keymap.set("n", "<leader>fqh", builtin.quickfixhistory)

      vim.keymap.set("n", "<leader>fif", builtin.current_buffer_fuzzy_find)

      vim.keymap.set("v", "<leader>fif", function()
        builtin.current_buffer_fuzzy_find({
          default_text = vim.getVisualSelection(),
        })
      end, opts)
    end,
  },

  --------------------------------------------------------------------------
  -- UI SELECT EXTENSION
  --------------------------------------------------------------------------

  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },

    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown(),
        },
      })

      telescope.load_extension("ui-select")
    end,
  },

  --------------------------------------------------------------------------
  -- FRECENCY
  --------------------------------------------------------------------------

  {
    "nvim-telescope/telescope-frecency.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },

    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
}
