return {
  -- normal mode
  n = {
    ["<leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<C-s>"] = { "<cmd>write<cr>", desc = "Write" }
  },
  i = {
    -- TODO: Why doesn't this work?
    ["<C-s>"] = { "jk<cmd>write<cr>a", desc = "Write" }
  }
}
