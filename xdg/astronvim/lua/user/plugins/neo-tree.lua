return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.filtered_items = {
      always_show = { "user" }
      -- hide_gitignored = false
    }
  end
}
