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
        }
      }
    }
  end
}
