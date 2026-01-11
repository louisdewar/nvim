return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      rename = { enabled = true },
      picker = {},
      explorer = {},
    },
    keys = {
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Switch Buffer" },
      { "<leader>/", function() Snacks.picker.grep({ hidden = true, args = { "--max-filesize=1M" } }) end, desc = "Grep" },
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>ff", function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files" },
      { "<leader>fF", function() Snacks.picker.files({ hidden = true, cwd = vim.fn.expand("%:p:h") }) end, desc = "Find Files (cwd)" },
      { "<leader>fe", function() Snacks.explorer() end, desc = "Explorer" },
      { "<leader>fE", function() Snacks.explorer({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Explorer (cwd)" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "<leader>gr", function() Snacks.picker.lsp_references() end, desc = "References" },
    },
  },
}
