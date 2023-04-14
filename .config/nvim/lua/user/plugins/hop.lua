return {
  "phaazon/hop.nvim",
  branch = 'v2', -- optional but strongly recommended
  config = function()
    require "hop".setup {}
    -- When in normal mode, initiate with a capital "H".
    vim.keymap.set('n', 'H', ":HopWord<cr>")
  end,
  event = "User AstroFile"
}
