return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      })
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
  { "MunifTanjim/nui.nvim",        lazy = true },
  { "rcarriga/nvim-notify",        lazy = false },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "arkav/lualine-lsp-progress",
    },
    opts = {
      sections = {
        lualine_c = {
          "lsp_progress"
        }
      }
    },
  },
  {
    "arkav/lualine-lsp-progress"
  }
}
