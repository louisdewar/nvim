local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferLineMovePrev<CR>', opts)
map('n', '<A->>', ' :BufferLineMoveNext<CR>', opts)

map('n', '<leader>bc', ':BufferLinePickClose<CR>', opts)
map('n', '<leader>bg', ':BufferLinePick<CR>', opts)
map('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts)
map('n', '<leader>bsd', ':BufferLineSortByRelativeDirectory<CR>', opts)
map('n', '<leader>bse', ':BufferLineSortByExtension<CR>', opts)
