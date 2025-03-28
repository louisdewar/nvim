return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
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
        "just",
        "hcl",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "python" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Schrink selection",  mode = "x" },
    },
    cmd = {
      "TSInstall",
      "TSUpdate",
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = { "IndianBoy42/tree-sitter-just" }
  },
  {
    "IndianBoy42/tree-sitter-just",
    opts = {},
  }
}
