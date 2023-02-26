return {
  {
    "echasnovski/mini.comment",
    dependencies = { "echasnovski/mini.nvim" },
    version = "*",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
};
