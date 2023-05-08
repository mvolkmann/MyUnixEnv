return {
  -- normal mode
  n = {
    ["<leader>gB"] = { "<cmd>GitBlameToggle<cr>", desc = "Git Blame Toggle" },
    ["<leader>x"] = { "<cmd>write<cr><cmd>source %<cr>", desc = "Save and Source" },
    ["<leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<C-s>"] = { "<cmd>write<cr>", desc = "Write" },
    ["bn"] = { "<cmd>echo nvim_get_current_buf()<cr>", desc = "Buffer Number" },
    ["sj"] = { "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join" }
  },
  i = {
    ["<C-s>"] = { "<esc><cmd>write<cr>a", desc = "Write" }
  }
}
