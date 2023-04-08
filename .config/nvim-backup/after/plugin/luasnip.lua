print("after/plugin/luasnip.lua entered")

local ls = require "luasnip"
require("luasnip.loaders.from_lua").load({
  paths = "~/.config/nvim/snippets/"
})

local types = require "luasnip.util.types"

ls.config.set_config {
  -- Remember last snippet so it can be easily recalled.
  history = true,

  -- This defines when dynamic snippets should update.
  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        -- TODO: This line is definitely wrong!
        virt_text = { { "?", "red" }}
      }
    }
  }
}

vim.keymap.set(
  {"i", "s"}, -- insert and select mode
  -- It is possible to use tab for this.
  "<tab>", -- press ctrl-k to expand snippet or jump to next placeholder
  function ()
    if ls.expand_or_jumpable() then
      -- ls.expand_or_jump()
      ls.expand()
    end
  end
)

vim.keymap.set(
  {"i", "s"}, -- insert and select mode
  -- It is possible to use shift-tab for this.
  "<shift-tab>", -- press ctrl-j to jump back to previous placeholder
  function ()
    if ls.jumpable(1) then
      ls.jump(1)
    end
  end
)

vim.keymap.set(
  {"i", "s" },-- insert and select mode
  "<c-l>", -- press ctrl-l to select an option from a choice nodes list
  function ()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end
)

vim.keymap.set(
  {"i", "s" },-- insert and select mode
  "<c-h>", -- press ctrl-l to select an option from a choice nodes list
  function ()
    if ls.choice_active() then
      ls.change_choice(-1)
    end
  end
)

