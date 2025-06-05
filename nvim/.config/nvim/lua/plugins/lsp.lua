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
    },
  },
}
