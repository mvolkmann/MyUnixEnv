return function(_, opts)
  local ls = require("luasnip")

  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
  })

  if opts then ls.config.setup(opts) end

  vim.tbl_map(
    function(type)
      require("luasnip.loaders.from_" .. type).lazy_load()
    end,
    { "vscode", "snipmate", "lua" }
  )
end
