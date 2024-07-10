local telescope = require("ldw.util").telescope

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    -- So it can override netrw (there might be a more efficient way of doing this)
    lazy = false,
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("ldw.util").get_root() })
        end,
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    config = function()
      vim.fn.sign_define("DiagnosticSignError",
        { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn",
        { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo",
        { text = " ", texthl = "DiagnosticSignInfo" })

      require("neo-tree").setup({
        filesystem = {
          hijack_netrw_behavior = "open_current",
        },
        -- filesystem = {
        --   bind_to_cwd = false,
        --   follow_current_file = true,
        --   use_libuv_file_watcher = true,
        -- },
        -- window = {
        --   mappings = {
        --     ["<space>"] = "none",
        --   },
        -- },
      })
    end
    -- init = function()
    --   vim.g.neo_tree_remove_legacy_commands = 1
    --   if vim.fn.argc() == 1 then
    --     local stat = vim.loop.fs_stat(vim.fn.argv(0))
    --     if stat and stat.type == "directory" then
    --       require("neo-tree")
    --     end
    --   end
    -- end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    keys = {
      { "<leader>,",  "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/",  telescope("live_grep"),                             desc = "Find in Files (Grep)" },
      { "<leader>:",  "<cmd>Telescope command_history<cr>",               desc = "Command History" },
      -- { "<leader><space>", telescope("files"), desc = "Find Files (root dir)" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
      { "<leader>ff", telescope("files"),                                 desc = "Find Files (root dir)" },
      { "<leader>fF", telescope("files", { cwd = false }),                desc = "Find Files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",                    desc = "status" },
    },
  },
  {
    "airblade/vim-rooter",
    lazy = false,
  },
  {
    'ThePrimeagen/harpoon',
  },
}
