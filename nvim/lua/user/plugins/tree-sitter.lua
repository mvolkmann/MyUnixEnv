return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    require 'nvim-treesitter.configs'.setup {
      incremental_selection = {
        enable = true,

        --[[ This is for nvim-orgmode and doesn't currently work.
        ensure_installed = { 'org' },
        highlight = {
          enable = true,
          -- Required for spellcheck, some LaTex highlights and
          -- code block highlights that do not have ts grammar
          additional_vim_regex_highlighting = { 'org' },
        }, ]]

        keymaps = {
          init_selection = "<leader>sw",    -- select word
          node_incremental = "<leader>sn",  -- incremental select node
          scope_incremental = "<leader>ss", -- incremental select scope
          node_decremental = "<leader>su"   -- incremental select undo
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = {"BufWrite", "CursorHold"},
        }
      }
    }
  end
}
