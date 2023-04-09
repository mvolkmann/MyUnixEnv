for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
  end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      "Error setting up colorscheme: " .. astronvim.default_colorscheme,
      "error"
    )
  end
end

require("astronvim.utils").conditional_func(
  astronvim.user_opts("polish", nil, false),
  true
)

-- Mark added all the lines below.

local indent = 2
vim.opt.shiftwidth = indent   -- indent code with two spaces
vim.opt.softtabstop = indent  -- tabs take two spaces
vim.opt.tabstop = indent      -- tabs take two spaces

vim.opt.colorcolumn = "80"    -- displays vertical strip at column 80 (not 81)
vim.opt.expandtab = true      -- replace tabs with spaces
vim.opt.hlsearch = true       -- highlights all search matches, not just first
vim.opt.incsearch = true      -- performs incremental searching.
vim.opt.number = true         -- shows line numbers
vim.opt.relativenumber = true -- shows relative line numbers
vim.opt.shiftround = true     --round indent to multiples of shiftwidth
vim.opt.smartindent = true    -- pressing tab key in insert mode insert spaces
vim.opt.smarttab = true       -- pressing tab key in insert mode insert spaces
vim.opt.termguicolors = true  -- uses 24-bit colors
vim.opt.wrap = false          -- prevents line wrapping at end of window or pane

-- Key mappings
-- TODO: These are supposed to map cmd-s to save, but I can't get them to work.
vim.keymap.set('n', '<80><fd>hs', ":w<cr>")
vim.keymap.set('i', '<80><fd>hs', "<Esc>:w<cr>i")
