return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "rust",
        "python",
        "yaml",
        "toml",
        "tsx",
        "json",
        "scss",
        "lua",
        "haskell",
        "cpp",
        "c",
        "javascript",
        "typescript",
        "markdown",
        "markdown_inline",
        "terraform",
        "hcl",
      },
    },
  },
}
