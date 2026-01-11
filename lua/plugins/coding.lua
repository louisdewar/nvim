return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = { documentation = { auto_show = true }, ghost_text = { enabled = true } },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      keymap = {
        preset = "enter",
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "ruifm/gitlinker.nvim",
    keys = {
      {
        "<leader>gy",
        desc = "Copy git link",
        mode = { "n", "v" },
      },
    },
    config = function()
      require("gitlinker").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "folke/neoconf.nvim", opts = {}, event = "VeryLazy" },
}
