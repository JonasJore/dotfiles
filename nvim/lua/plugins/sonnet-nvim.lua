return {
  name = "sonnet.nvim",
  "jonasjore/sonnet.nvim",
  config = function()
    require("sonnet").setup({
      keymap = "<Leader>ai",
    })
  end,
}
