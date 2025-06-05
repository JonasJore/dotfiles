-- Catppuccin theme
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", --  Flavour to be used
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
