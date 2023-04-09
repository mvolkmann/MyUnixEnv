return {
  "phaazon/hop.nvim",
  branch = 'v2', -- optional but strongly recommended
  config = function()
    require "hop".setup { keys = 'etovxqpdygfblzhckisuran' }
    -- Configure Hop the way you like here. See `:h hop-config`
    vim.keymap.set('n', '<leader>H', ":HopWord<cr>")
  end,
  event = "User AstroFile"
}
