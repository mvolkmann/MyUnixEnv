local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

configs.prolog_lsp = {
  default_config = {
    cmd = { "swipl",
      "-g", "use_module(library(lsp_server)).",
      "-g", "lsp_server:main",
      "-t", "halt",
      "--", "stdio" },
    filetypes = { "prolog" },
    root_dir = util.root_pattern("pack.pl"),
  },
  docs = {
    description = [[
  https://github.com/jamesnvc/prolog_lsp

  Prolog Language Server
  ]],
  }
}
