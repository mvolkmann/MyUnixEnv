return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require "telescope.actions"
    opts.defaults.mappings.n["<Esc>"] = actions.close
  end
}
