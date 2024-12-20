return {
  "mfussenegger/nvim-jdtls",
  config = function ()
    local config = {
      cmd = {'C:\\Users\\Dannick.bedard\\AppData\\Local\\nvim-data\\mason\\bin\\jdtls.cmd'},
      root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(config)
  end
}
