return {
  "kdheepak/lazygit.nvim"
  --[[
  config = function()
    require("lazygit").setup {
      pager = "delta",
      delta = "side-by-size"
    }
  end,
  event = "User AstroFile" -- need this?
  --]]
}
