return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- lua
      lua_ls = {},
      -- typescript
      tsserver = {},
      eslint = {},
      -- python
      pyright = {},
      -- rust
      rust_analyzer = {},
      -- go
      gopls = {},
      tailwindcss = {},
      svelte = {},
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "svelte", "lua", "typescript", "rust", "javascript", "python", "rust", "go" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "svelte-language-server" },
    },
  },
}
