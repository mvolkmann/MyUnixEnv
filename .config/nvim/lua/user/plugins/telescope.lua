return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require "telescope.actions"
    return {
      defaults = {
        mappings = {
          n = { ["<Esc>"] = actions.close }
        },
      },
    }
  end
}
