local shouldRun = false

if (not(shouldRun))
then
return {}
else
return {
  {
    "mfussenegger/nvim-dap",

    config = function()
      local dap  = require'dap'

      -- require'dap'.toggle_breakpoint()
      -- ....continue()
      -- ....step_over()
      -- ....step_into()
      -- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
      --See :help dap.txt, :help dap-mapping and :help dap-api.
      --

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<leader>dc', dap.continue, {})
      vim.keymap.set('n', '<leader>do', dap.step_over, {})
      vim.keymap.set('n', '<leader>di', dap.step_into, {})
      vim.keymap.set('n', '<leader>dh', dap.repl.open, {})
      dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { 'C:\\Users\\Dannick.bedard\\AppData\\Local\\nvim-data\\mason\\packages\\php-debug-adapter\\php-debug-adapter.cmd' }
      }
      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003
        }
      }
      --https://github.com/nvim-telescope/telescope-dap.nvim
      -- require('telescope').load_extension('dap')
   --    local telescope_dap = require'telescope'.extensions.dap

      -- vim.keymap.set('n', '<leader>dh', telescope_dap.commands, {})
      -- require'telescope'.extensions.dap.commands{}
      -- require'telescope'.extensions.dap.configurations{}
      -- require'telescope'.extensions.dap.list_breakpoints{}
      -- require'telescope'.extensions.dap.variables{}
      -- require'telescope'.extensions.dap.frames{} tn

    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "php", "js" }
      })
    end
  }
}
end
