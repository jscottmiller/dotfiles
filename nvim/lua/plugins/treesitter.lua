---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "go",
        "gomod",
        "gosum",
        "typescript",
        "tsx",
        "javascript",
        "python",
        "lua",
        "vim",
        "json",
        "yaml",
        "toml",
        "markdown",
        "bash",
        "dockerfile",
      },
    },
  },
}
