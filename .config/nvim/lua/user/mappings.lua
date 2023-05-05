return {
  -- normal mode
  n = {
    ["<leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<C-s>"] = { "<cmd>write<cr>", desc = "Write" },
    ["gb"] = { "<cmd>GitBlameToggle<cr>", desc = "Git Blame Toggle" },
    ["sj"] = { "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join" }
  },
  i = {
    -- TODO: Why doesn't this work?
    ["<C-s>"] = { "jk<cmd>write<cr>a", desc = "Write" }
  }
}