return {
   "DannickBedard/githelper.nvim",
    config = function ()
        local border = require("githelper.border")
        require("githelper").setup({
            border = border.simpleRoundedBorder, -- doubleBorder, simpleBorder, simpleRoundedBorder, simpleThickBorder
       --     gitKeymap = {
       --         quit = "q",
       --         edit = "<cr>",
       --         stage = "s",
       --         unstage = "u",
       --         discard = "d",
       --         commit = "c",
       --         push = "p",
       --         pull = "pl",
       --     }
        });
    end
}
