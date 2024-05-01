local shouldbeInstall = false

if shouldbeInstall then
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
}
  
else 
  return {}
end
