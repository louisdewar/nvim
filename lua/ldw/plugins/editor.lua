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
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        map('n', '<leader>tb', gs.toggle_current_line_blame, "Toggle show blame")
      end,
    },
    {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end
    }
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = { 'kylechui/nvim-surround' },
    branch = 'v0.6',
    opts = {
      extensions = {
        -- -- In 0.7 the typo is fixed
        -- suround = {
        --   dosuround = true,
        --   suround = true,
        -- },
        -- config_internal_pairs = {
        --   { '{', '}', suround = true },
        --   { '[', ']', suround = true },
        --   { '(', ')', suround = true },
        -- },
      },
      config_internal_pairs = {
        { '(', ')', fly = true, suround = true, dosuround = true, newline = true, space = true }
      },
    },
  },
}
