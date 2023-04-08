print("after/plugin/lsp.lua entered")

local lsp = require "lsp-zero"
local ls = require "luasnip"

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Configure the Lua language server for neovim.
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed {
  "eslint",
  "lua_ls",
  "tsserver"
}

lsp.setup()

local cmp = require "cmp"
local cmp_action = lsp.cmp_action()

cmp.setup({
  mapping = {
    ['<cr>'] = cmp.mapping.confirm({select = true})
  }
})

