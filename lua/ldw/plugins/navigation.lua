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

-- function telescope(builtin, opts)
--   local params = { builtin = builtin, opts = opts }
--   return function()
--     builtin = params.builtin
--     opts = params.opts
--     opts = vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {})
--     if builtin == "files" then
--       if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
--         opts.show_untracked = true
--         builtin = "git_files"
--       else
--         builtin = "find_files"
--       end
--     end
--     require("telescope.builtin")[builtin](opts)
--   end
-- end
--
-- return {
--   -- file explorer
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     cmd = "Neotree",
--     keys = {
--       {
--         "<leader>fe",
--         function()
--           require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
--         end,
--         desc = "Explorer NeoTree (root dir)",
--       },
--       {
--         "<leader>fE",
--         function()
--           require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--         end,
--         desc = "Explorer NeoTree (cwd)",
--       },
--       { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
--       { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
--     },
--     deactivate = function()
--       vim.cmd([[Neotree close]])
--     end,
--     init = function()
--       vim.g.neo_tree_remove_legacy_commands = 1
--       if vim.fn.argc() == 1 then
--         local stat = vim.loop.fs_stat(vim.fn.argv(0))
--         if stat and stat.type == "directory" then
--           require("neo-tree")
--         end
--       end
--     end,
--     opts = {
--       filesystem = {
--         bind_to_cwd = false,
--         follow_current_file = true,
--       },
--       window = {
--         mappings = {
--           ["<space>"] = "none",
--         },
--       },
--     },
--   },
--
--   -- search/replace in multiple files
--   {
--     "windwp/nvim-spectre",
--     -- stylua: ignore
--     keys = {
--       { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
--     },
--   },
--
--   -- fuzzy finder
--   {
--     "nvim-telescope/telescope.nvim",
--     cmd = "Telescope",
--     version = false, -- telescope did only one release, so use HEAD for now
--     keys = {
--       { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
--       { "<leader>/", telescope("live_grep"), desc = "Find in Files (Grep)" },
--       { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--       { "<leader><space>", telescope("files"), desc = "Find Files (root dir)" },
--       -- find
--       { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
--       { "<leader>ff", telescope("files"), desc = "Find Files (root dir)" },
--       { "<leader>fF", telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
--       { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
--       -- git
--       { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
--       { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
--       -- -- search
--       -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
--       -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
--       -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--       -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
--       -- { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
--       -- { "<leader>sg", telescope("live_grep"), desc = "Grep (root dir)" },
--       -- { "<leader>sG", telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
--       -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
--       -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
--       -- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
--       -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
--       -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
--       -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
--       -- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
--       -- { "<leader>sw", telescope("grep_string"), desc = "Word (root dir)" },
--       -- { "<leader>sW", telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
--       -- { "<leader>uC", telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
--       {
--         "<leader>ss",
--         telescope("lsp_document_symbols", {
--           symbols = {
--             "Class",
--             "Function",
--             "Method",
--             "Constructor",
--             "Interface",
--             "Module",
--             "Struct",
--             "Trait",
--             "Field",
--             "Property",
--           },
--         }),
--         desc = "Goto Symbol",
--       },
--       {
--         "<leader>sS",
--         telescope("lsp_workspace_symbols", {
--           symbols = {
--             "Class",
--             "Function",
--             "Method",
--             "Constructor",
--             "Interface",
--             "Module",
--             "Struct",
--             "Trait",
--             "Field",
--             "Property",
--           },
--         }),
--         desc = "Goto Symbol (Workspace)",
--       },
--     },
--     opts = {
--       defaults = {
--         prompt_prefix = " ",
--         selection_caret = " ",
--         mappings = {
--           i = {
--             ["<c-t>"] = function(...)
--               return require("trouble.providers.telescope").open_with_trouble(...)
--             end,
--             ["<a-i>"] = function()
--               telescope("find_files", { no_ignore = true })()
--             end,
--             ["<a-h>"] = function()
--               telescope("find_files", { hidden = true })()
--             end,
--             ["<C-Down>"] = function(...)
--               return require("telescope.actions").cycle_history_next(...)
--             end,
--             ["<C-Up>"] = function(...)
--               return require("telescope.actions").cycle_history_prev(...)
--             end,
--             ["<C-f>"] = function(...)
--               return require("telescope.actions").preview_scrolling_down(...)
--             end,
--             ["<C-b>"] = function(...)
--               return require("telescope.actions").preview_scrolling_up(...)
--             end,
--           },
--           n = {
--             ["q"] = function(...)
--               return require("telescope.actions").close(...)
--             end,
--           },
--         },
--       },
--     },
--   },
-- }
