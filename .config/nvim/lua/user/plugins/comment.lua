return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup {
      opleader = {
        block = "gb",
        line = "gc"
      },
      mappings = {
        basic = true,
        extra = true
      }
    }
  end
}
