return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     show_current_context = true,
  --     show_current_context_start = true,
  --   },
  -- },
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
  { "rcarriga/nvim-notify", lazy = false },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
