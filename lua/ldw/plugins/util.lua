return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim",  lazy = true },
  { "sindrets/diffview.nvim", lazy = true },
  { "ibhagwan/fzf-lua",       lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat",       event = "VeryLazy" },
  { "echasnovski/mini.nvim",  version = "*" }
}
