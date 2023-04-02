print("after/plugin/colors.lua entered")

-- TODO: Why wrap this code in a function?
-- TODO: Is it because this might be called from another file?
function colorTheme(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  -- These lines give us a transparent background.
  -- Depending on the terminal background,
  -- this can make the text hard to read.
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Overwrite some settings.
  -- Syntax names include:
  --[[
Boolean
Character
Comment
Conditional
Constant
Debug
Define
Delimiter
Exception
Float
Function
Identifier
Include
Keyword
Label
Macro
Number
Operator
PreProc
Repeat
Special
SpecialChar
StorageClass
String
Structure
Tag
Title
Todo
Type
Typedef
Underlined
]]
  -- TODO: TUNE THESE AND FIND MORE GROUP NAMES!
  -- vim.api.nvim_set_hl(0, "Comment", {fg="green"})
  -- TODO: I can't find a name that maps to the dot operator!
  -- vim.api.nvim_set_hl(0, "Special", {fg="red", bold=true})
  -- vim.api.nvim_set_hl(0, "Function", {fg="orange"})
  -- vim.api.nvim_set_hl(0, "Normal", {fg="red"})
  -- vim.api.nvim_set_hl(0, "Operator", {bg="yellow", fg="red", bold=true})
  -- vim.api.nvim_set_hl(0, "String", {fg="blue"})
  -- vim.api.nvim_set_hl(0, "Boolean", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Character", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Comment", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Conditional", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Constant", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Debug", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Define", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Delimiter", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Exception", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Float", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Function", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Identifier", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Include", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Keyword", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Label", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Macro", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Number", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Operator", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "PreProc", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Repeat", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Special", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "SpecialChar", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "StorageClass", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "String", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Structure", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Tag", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Title", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Todo", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Type", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Typedef", {bg="yellow"})
  -- vim.api.nvim_set_hl(0, "Underlined", {bg="yellow"})
end

colorTheme()

