-- vim.g.nvim_tree_quit_on_open = 1

require('nvim-tree').setup({
  open_on_setup = true,
  diagnostics = {
    enable = true,
  },
  view = {
    auto_resize = true,
  },
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
