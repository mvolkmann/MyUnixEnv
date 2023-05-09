local function buf_name()
  local filePath = vim.fn.expand("%: p")
  local pathParts = vim.split(filePath, "/")
  local fileName = pathParts[#pathParts]
  return fileName
end

-- This runs a Lua program in a new terminal.
vim.api.nvim_create_user_command(
  "TermRun",
  function()
    for _, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf_hndl) then
        print("buffer =", buf_hndl)
        -- TODO: Get the name of each buffer.
        -- TODO: Can you determine if it is a terminal?
      end
    end

    local command = "lua " .. buf_name() .. "\\n"
    vim.cmd("vsplit | terminal")
    vim.cmd(':call jobsend(b:terminal_job_id, "' .. command .. '")')
  end,
  {} -- options
)

-- Supposedly multiple plugins can be loaded this way rather than
-- creating a separate .lua file for each one in the
-- lua/user/plugins directory, but I could not get this to work.
--[[
require("lazy").setup({
  {
    "mvolkmann/greet.nvim",
    config = function()
      require "greet"
    end
  }
})
]]

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
