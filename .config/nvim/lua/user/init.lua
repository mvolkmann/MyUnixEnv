return {
  -- colorscheme = "astrodark"
  -- colorscheme = "astrolight"
  -- colorscheme = "catppuccin"

  polish = function()
    vim.opt.spell = true
    -- vim.opt.spelllang = "en_us" -- defaults to "en"
    vim.opt.spelloptions = "camel"

    -- TODO: It seems Warp terminal or the font I'm using doesn't
    -- TODO: support undercurl text, but it does support underline text.
    vim.api.nvim_set_hl(
      0, -- global highlight group
      'SpellBad',
      { fg = "red", underline = true }
    )
  end
}
