vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':GitBlameToggle<CR>', { noremap = true, silent = true })
vim.g.gitblame_enabled = false
