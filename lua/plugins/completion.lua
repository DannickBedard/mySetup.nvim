return {
  --
  --
  -- LSP
  -- 
  --
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
         -- "intelephense",
          -- "phpactor",
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
      local util = require 'lspconfig.util'


      --
      --
      -- SEE completion.lua for the setup... 
      -- If setup call two time the second will override the first one...
      --
      --

      -- LUA
      -- lspconfig.lua_ls.setup({})

      -- JS
      -- lspconfig.tsserver.setup({})

      -- PHP
      -- lspconfig.intelephense.setup({ cmd = {"intelephense", "--stdio" }, root_dir = lspconfig.util.root_pattern(".git") })
      -- CSS
      -- lspconfig.cssls.setup({})

      -- C#
      -- lspconfig.csharp_ls.setup({})
      -- lspconfig.omnisharp.setup({})

      -- javas
      --lspconfig.jdtls.setup({})

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
  --
  --
  -- Completion
  --
  --
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function ()
      local ls = require("luasnip")
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true}
      )
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require'cmp'

      local util = require 'lspconfig.util'

      require("luasnip.loaders.from_vscode").load({paths = "./my_snippets"})

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'luasnip' }, -- For luasnip users.
        })
      })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })

      lspconfig.intelephense.setup({
        capabilities = capabilities,
        cmd = { 'intelephense', '--stdio' },
        filetypes = { 'php' },
        root_dir = function(pattern)
          -- Seem to not work always if i don't do this. I always open my projects into cd into it and after open nvim .
          local cwd = vim.loop.cwd() -- current root dir
          return cwd
        end,
      })

      lspconfig.psalm.setup({
        capabilities = capabilities
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      lspconfig.cssls.setup({
        capabilities = capabilities
      })

      lspconfig.jdtls.setup({
        capabilities = capabilities
      })

      lspconfig.csharp_ls.setup({
        capabilities = capabilities
      })

      lspconfig.omnisharp.setup({
        capabilities = capabilities
      })

      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })


      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          },
          {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
      })


    end
  },
}
