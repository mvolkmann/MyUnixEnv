print("after/plugin/luasnip.lua entered")
-- If snippets are not being mananged by LuaSnip then exit.
if vim.g.snippets ~= "luasnip" then return end
print("using luasnip")

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  -- Remember last snippet so it can be easily recalled.
  history = true,

  -- This defines when dynamic snippets should update.
  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ "<-", "Error" }}
      }
    }
  }
}

vim.keymap.set(
  {"i", "s"}, -- insert and select mode
  -- It is possible to use tab for this.
  "<c-k>", -- press ctrl-k to expand snippet or jump to next placeholder
  function ()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
 { silent = true }
)

vim.keymap.set(
  {"i", "s"}, -- insert and select mode
  -- It is possible to use shift-tab for this.
  "<c-j>", -- press ctrl-j to jump back to previous placeholder
  function ()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
 { silent = true }
)

vim.keymap.set(
  "i", -- insert mode
  "<c-l>", -- press ctrl-l to select an option from a choice nodes list
  function ()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end
)

local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep -- repeats placeholder text

-- There are two ways to define a syntax.
-- The first is pass a VS Code-style snippet string
-- to the `parse_snippet` function.
-- The second is to use luasnip functions
-- which are more powerful, but more verbose.

-- After changing the snippets table, enter ":so"
-- to make the changes available without restarting nvim.
ls.snippets = {
  all = {
    -- These snippets are available for all file types.
    -- TODO: THIS DOES NOT WORK!
    ls.parser.parse_snippet("expand", "-- This is a test comment.")
  },
  js = {
    -- TODO: Can you insert the current function name?
    -- TODO: THESE DO NOT WORK!
    ls.parser.parse_snippet("loge", "console.log('$TM_FILENAME.$1: entered')"),
    ls.parser.parse_snippet("logv", "console.log('$TM_FILENAME.$1: $2 =', $2)")
  },
  lua = {
    -- ls.parser.parse_snippet("tc", "-- This is a test comment."),
    -- Creates a local function.
    ls.parser.parse_snippet("lf", "local function $1($2)\n  $0\nend"),

    -- This is an example of a luasnip-style snippet.
    -- TODO: THIS DOES NOT WORK!
    -- ls.s("req", fmt('local {} = require "{}"'), { i(1), rep(1) })
  }
}

