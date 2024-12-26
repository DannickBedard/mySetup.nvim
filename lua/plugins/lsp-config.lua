return {
  {
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup({PATH = "prepend"})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- LUA
          "lua_ls",
          -- JS
          "tsserver",
          -- PHP
          "intelephense",
          -- missing requirement"phpactor",
          -- missing requirement "psalm"
          -- CSS
          "cssls",
          "jdtls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- LUA
      lspconfig.lua_ls.setup({})
      -- JS
      lspconfig.tsserver.setup({})
      -- PHP
      lspconfig.intelephense.setup({})
      -- CSS
      lspconfig.cssls.setup({})

      -- C#
      lspconfig.csharp_ls.setup({})
      lspconfig.omnisharp.setup({})
      -- javas
      lspconfig.jdtls.setup({})

      -- missing requirement lspconfig.phpactor.setup({})
      -- missing requirement lspconfig.psalm.setup({})

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next) -- Navigate throw lsp error, warn
      vim.keymap.set('n', '<leader>dN', vim.diagnostic.goto_prev)

      vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist)
      -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- Put in quickfix list outgoing_calls
          vim.keymap.set('n', '<leader>oc', vim.lsp.buf.outgoing_calls, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },
}
