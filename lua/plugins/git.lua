return {
  {
    "f-person/git-blame.nvim",
    config = function ()
      require('gitblame').setup {
        -- TODO to check gitsign
        --Note how the `gitblame_` prefix is omitted in `setup`
        enabled = false,
        gitblame_message_template =  '<date> • <author> • <sha>',
        gitblame_max_commit_summary_length = 35
      }

      vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', {})

    end
  }
}
