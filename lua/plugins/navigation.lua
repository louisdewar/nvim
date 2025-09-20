local function telescope_find_files(cwd)
  return function()
    local utils = require("telescope.utils")
    require("telescope.builtin").find_files({
      cwd = cwd and utils.buffer_dir() or nil,
      find_command = { "rg", "--ignore", "--hidden", "--files", "--glob", "!.git/", "--max-filesize=1M" },
    })
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      {
        "<leader>ff",
        telescope_find_files(false),
        desc = "Find Files (root dir)",
      },
      {
        "<leader>fF",
        telescope_find_files(true),
        desc = "Find Files (cur dir)",
      },
    },
    config = function()
      local telescopeConfig = require("telescope.config")

      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, "--hidden")
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")
      table.insert(vimgrep_arguments, "--max-filesize=1M")

      require("telescope").setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
      })
    end,
    -- opts = {
    --   defaults = {
    --     vimgrep_arguments = { "--ignore", "--hidden", "--files", "--glob", "!.git/", "--max-filesize=1M" },
    --   },
    -- },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },

    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {},
  },
}
