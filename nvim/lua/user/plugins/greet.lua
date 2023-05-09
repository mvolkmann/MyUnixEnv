print("in greet.lua")
return {
  "mvolkmann/greet.nvim",
  config = function()
    require "greet"
  end
}
