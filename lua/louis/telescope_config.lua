local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-o>', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)

-- TODO: consider different keybinds as this will slow down <leader>f (formatting) since they both begin with f
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
