-- vim.g.nvim_tree_quit_on_open = 1

require('nvim-tree').setup({
  -- open_on_setup = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  view = {
    adaptive_size = true,
    side = 'left',
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-n>', "<cmd>lua require('tree').toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
