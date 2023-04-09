-- This does get executed, but configuring plugins here doesn't work for me.
-- I can configure them in their own files though.
-- For example, see `hop.lua` and todo-comments.lua` in this same directory.
print("user.lua entered")
return {
  --[[
  {
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
  --]]
}
