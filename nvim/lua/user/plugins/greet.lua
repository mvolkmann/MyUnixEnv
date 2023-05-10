return {
  "mvolkmann/greet.nvim",
  lazy = false, -- load on startup, not just when required
  config = function()
    -- This plugin does not have a setup function.
    require "greet"
  end
}
