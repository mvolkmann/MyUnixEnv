return {
  -- normal mode
  n = {
    ["<leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<leader>x"] = { "<cmd>write<cr><cmd>source %<cr>", desc = "Save and Source" },
    ["<C-s>"] = { "<cmd>write<cr>", desc = "Write" },
    ["bn"] = { "<cmd>echo nvim_get_current_buf()<cr>", desc = "Buffer Number" },
    ["gb"] = { "<cmd>GitBlameToggle<cr>", desc = "Git Blame Toggle" },
    ["sj"] = { "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join" }
  },
  i = {
    -- TODO: Why doesn't this work?
    ["<C-s>"] = { "jk<cmd>write<cr>a", desc = "Write" }
  }
}
