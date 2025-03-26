return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neoconf.nvim",
    },
    config = function()
      require("ldw.plugins.lsp.servers").configure_servers()
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "VeryLazy" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = { "rust_analyzer@nightly" },
      automatic_installation = true,
    },
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    config = true,
  },
}
