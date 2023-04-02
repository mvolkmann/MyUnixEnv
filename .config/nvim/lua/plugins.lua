-- NOTE: After changing this file, enter :PackerSync

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- gruvbox Theme (bad)
  -- use { "ellisonleao/gruvbox.nvim", as = "gruvbox" }

  -- LSP Zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Lua Snip
  use({
    "L3MON4D3/LuaSnip",
    -- use latest release.
    tag = "v<CurrentMajor>.*",
    -- install optional jsregexp package
    run = "make install_jsregexp"
  })

  -- nightfly Theme
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }

  -- onedark Theme (bad)
  -- use { "navarasu/onedark.nvim", as = "onedark" }

  -- rose-pine Theme
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function ()
      vim.cmd("colorscheme rose-pine")
    end
  })

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  -- Fugitive
  -- Enter :Git {any-git-command}
  use("tpope/vim-fugitive")

  -- VS Code Theme (bad)
  -- use { "Mofiqul/vscode.nvim", as = "vscode" }
end)
