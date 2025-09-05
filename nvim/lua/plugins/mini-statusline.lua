return {
  -- Disable lualine (LazyVim default)
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  -- Add mini.statusline
  {
    "echasnovski/mini.statusline",
    lazy = false,
    priority = 1000,
    version = false, -- always use latest
    config = function()
      require("mini.statusline").setup({
        use_icons = true, -- set to false if you don't have a Nerd Font
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            return MiniStatusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
              "%<", -- truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- right align
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            })
          end,
        },
      })
    end,
  },
}
