return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
  -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
  -- spec defers loading until a <leader>a* mapping is pressed and the commands
  -- would not exist yet.
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  keys = {
    { "<leader>i", nil, desc = "Claude Code" },
    { "<leader>ii", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>if", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ir", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
    { "<leader>ic", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last Claude session" },
    { "<leader>im", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    -- Send current file / selection to the session
    { "<leader>ib", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
    { "<leader>is", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    -- Add file under cursor from file explorers
    { "<leader>is", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file to Claude", ft = { "neo-tree", "oil" } },
    -- Diffs proposed by Claude
    { "<leader>iy", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>in", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  }
}
