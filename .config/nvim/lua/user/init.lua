-- I want to use this require instead of defining attach_to_buffer
-- and calling vim.api.nvim_create_user_command here,
-- but I can't get LUA_PATH to find it!
-- See https://www.reddit.com/r/lua/comments/1390uvm/lua_path/
require "autorun" -- in ~/lua which is LUA_PATH

--[[ local function attach_to_buffer(bufnr, pattern, command)
  -- read ":help autocmd"
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("RMV", { clear = true }),
    pattern = pattern,
    callback = function()
      local function append_data(_, data)
        -- This inserts or replaces lines of text at a given buffer line.
        -- 1st argument is the buffer number.
        -- 2nd argument is the starting line number (-1 for end).
        -- 3rd argument is the ending line number.
        -- 4th argument is whether an error can be raised.
        -- 5th argument is a list of lines to be written.
        -- TODO: How can you make this text red?
        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
      end

      vim.fn.jobstart(command, {
        stdout_buffered = true, -- only send complete lines
        on_stdout = append_data,
        on_stderr = append_data
      })
    end
  })
end

-- To get the number of the current buffer, enter :echo nvim_get_current_buf()
-- attach_to_buffer(153, "*.lua", { "lua", "numbers.lua" })

vim.api.nvim_create_user_command(
  "AutoRun",
  function()
    local bufnum = vim.fn.input "Buffer Number: "
    local pattern = vim.fn.input "File Pattern: "
    local command = vim.fn.input "Command: "
    local words = vim.split(command, " ")
    local filePath = vim.api.vim_buf_get_name(0)
    local pathParts = vim.split(filePath, "/")
    local fileName = pathParts[#pathParts]
    print("fileName =", fileName)
    print("words =", words)
    attach_to_buffer(tonumber(bufnum), pattern, words)
  end,
  {} -- options
)
]]
local function buf_name()
  local filePath = vim.fn.expand("%: p")
  local pathParts = vim.split(filePath, "/")
  local fileName = pathParts[#pathParts]
  return fileName
end

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
