print("init.lua entered")

-- TODO: Does this only look for "plugins.lua" in the "lua" subdirectory?
-- TODO: Can "lua/plugins.lua" be moved to the same directory as this file?
require "plugins"

-- TODO: Improve color of line numbers.
-- TODO: Configure cmd-s to save.

vim.g.mapleader = " " -- many people use comman instead of space
vim.g.snippets = "luasnip"

-- This causes the yank(copy) and delete(cut) commands to copy to the
-- system clipboard so the copied text can be pasted into another app.
vim.opt.clipboard = "unnamed"

local indent = 2
vim.opt.shiftwidth=indent -- indent code with two spaces
vim.opt.softtabstop=indent -- tabs take two spaces
vim.opt.tabstop=indent -- tabs take two spaces

vim.opt.colorcolumn = "80" -- displays a vertical strip at column 80 (not 81)
vim.opt.expandtab = true -- replace tabs with spaces
vim.opt.hlsearch = true -- highlights all search matches, not just first
vim.opt.incsearch = true -- performs incremental searching.
vim.opt.number = true -- shows line numbers
vim.opt.relativenumber= true -- shows relative line numbers
vim.opt.shiftround = true --round indent to multiples of shiftwidth
vim.opt.smartindent = true -- pressing tab key in insert mode insert spaces
vim.opt.smarttab = true -- pressing tab key in insert mode insert spaces
vim.opt.termguicolors = true -- uses 24-bit colors
vim.opt.wrap = false -- prevents line wrapping at end of window or pane

-- Key mappings
-- These are supposed to map cmd-s to save, but I can"t get them to work.
vim.keymap.set("n", "<D-s>", ":w<kEnter>")
vim.keymap.set("i", "<D-s", "<Esc>:w<kEnter>i")

-- This automatically runs the `:PackerCompile` command
-- every time the `~/.config/nvim/lua/plugins.lua` file is updated.
-- TODO: Is this really working?
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


