-- Trouble (diagnostics)
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', opts)
