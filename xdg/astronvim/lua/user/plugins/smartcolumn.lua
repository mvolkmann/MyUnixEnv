-- This only displays a vertical line in a given column if
-- one of the visible lines contains text that extends past that column.
return {
  "m4xshen/smartcolumn.nvim",
  opts = {
    -- colorcolumn = 80 -- This is the default.
    -- Don't disable any file types.
    disabled_filetypes = {} -- default is {"help", "text", "markdown"}
  },
  event = "User AstroFile"
}
