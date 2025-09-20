return {
  -- {
  --   "stevedylandev/darkmatter-nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme darkmatter")
  --   end,
  -- },
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
        },
      })
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
}
