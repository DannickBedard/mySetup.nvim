
local isValid = false

if isValid then
  
return {
  dir = "~/.config/nvimPlug/githelper.nvim",
  config = function ()
    local border = require("githelper.border")

    local gitKeymap = {
      quit = "q",
      edit = "<cr>",
      stage = "s",
      unstage = "u",
      discard = "d",
      commit = "c",
      push = "p",
      pull = "pl",
    }


    require("githelper").setup({
      border = border.simpleRoundedBorder,
      gitKeymap = gitKeymap,
    });
  end
}
else
  return {}
end

