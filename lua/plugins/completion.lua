return {
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
