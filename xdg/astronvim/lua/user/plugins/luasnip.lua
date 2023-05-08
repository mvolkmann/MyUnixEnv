return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    require "plugins.configs.luasnip" (plugin, opts)
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { "./lua/user/snippets" }
    }
  end
}

-- These are recommended key mappings from https://github.com/L3MON4D3/LuaSnip.
-- TODO: How can you configure these?
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
