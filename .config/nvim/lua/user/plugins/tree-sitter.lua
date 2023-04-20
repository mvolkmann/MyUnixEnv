return {
  "nvim-treesitter/nvim-treesitter",
  opts = function()
    require 'nvim-treesitter.configs'.setup {
      incremental_selection = {
        enable = true,
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
