local telescope = require("ldw.util").telescope

-- local function trail(command, opts)
--   return function ()
--     require("trailblazer")[command](table.unpack(opts or {}))
--   end 
-- end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
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
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
    },
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
    "LeonHeidelbach/trailblazer.nvim",
    init = function ()
      require("trailblazer").setup({
        -- -- Disable default keybindings
        -- force_mappings = {},
        -- force_quickfix_mappings = {}
      })
    end,
    -- I can't be bothered listing every command/mapping
    event = "VeryLazy",
    -- keys = {
    --   { "<A-l>", trail("new_trail_mark"), mode = { "n", "i" }, desc = "New trail mark" },
    --   { "<A-b>", trail("track_back"), mode = { "n", "i" }, desc = "Pop the trail mark stack" },
    --   { "<A-b>", trail("track_back"), mode = { "n", "i" }, desc = "Track back up the trail mark stack" },
    -- }
  }
}
