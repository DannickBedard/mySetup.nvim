
local isValid = false

if isValid then
  
return {
  dir = "~/.config/nvimPlug/test.nvim",
  config = function ()
    
    require("test").setup({name = "Dannick"});
  end
}
else
  return {}
end

