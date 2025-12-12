return {
  "niuiic/track.nvim",
  config = function ()
    vim.print("test -1")
    vim.api.nvim_set_hl(0, "TrackFlow", { fg = "#eb9007" })
    vim.api.nvim_set_hl(0, "TrackMark", { fg = "#15f700" })

    require("track").setup({
      mark = {
        mark_hl_group = "TrackMark",
      },
      outline = {
        win_pos = "right",
        flow_hl_group = "TrackFlow",
        mark_hl_group = "TrackMark",
        set_default_when_update = true,
        preview_on_hover = false,
        keymap_update = "r",
      },
    })

    vim.api.nvim_create_user_command("Track", function(opts)
        local track = require("track")
        local action = opts.fargs[1]

        local actions = {
            AddFlow      = function() track.add_flow() end,
            AddMark      = function() track.add_mark() end,
            UpdateMark   = function() track.update_mark(true) end,
            UpdateFlow   = function() track.update_flow() end,
            DeleteMark   = function() track.delete_mark() end,
            DeleteMarks  = function() track.delete_marks() end,
            ToggleOutline = function()
                if track.is_outline_open() then
                    track.close_outline()
                else
                    track.open_outline(true)
                end
            end,
            OpenOutline  = function() track.open_outline(true) end,
            SelectOutline = function() track.open_outline() end,
            CloseOutline = function() track.close_outline() end,
            GotoOutline  = function() track.navigate_to_outline() end,
        }

        if actions[action] then
            actions[action]()
        else
            vim.notify("Track: unknown subcommand '" .. (action or "") .. "'", vim.log.levels.ERROR)
        end
    end, {
        nargs = "*",  -- <-- IMPORTANT
        complete = function()
            return {
                "AddFlow",
                "AddMark",
                "UpdateMark",
                "UpdateFlow",
                "DeleteMark",
                "DeleteMarks",
                "ToggleOutline",
                "OpenOutline",
                "SelectOutline",
                "CloseOutline",
                "GotoOutline",
            }
        end,
    })


  end,
}
