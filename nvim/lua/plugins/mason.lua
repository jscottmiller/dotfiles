---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- go
        "gopls",
        "goimports",
        "gofumpt",
        "delve",

        -- typescript
        "typescript-language-server",
        "prettier",
        "eslint-lsp",

        -- python
        "pyright",
        "ruff",
        "debugpy",

        -- lua
        "lua-language-server",
        "stylua",
      },
    },
  },
}
