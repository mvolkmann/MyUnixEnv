return {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- Add your configuration comes here or
      -- leave it empty to use the default settings.
    }
  end,
  event = "User AstroFile"
}
