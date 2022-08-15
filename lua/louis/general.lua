local o = vim.o
local w = vim.wo
local b = vim.b

w.number = true

b.expandtab = true
b.shiftwidth = 4

o.inccommand = 'nosplit'
o.mouse = 'a'

o.splitright = true

-- Quick buffer switching
vim.api.nvim_set_keymap('n', '<leader><leader>', ':b#<CR>', { noremap = true, silent = true })

-- Quick save
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-w>', '<Esc> :w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>', '<Esc> :w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-w>', '<Esc> :w<CR>', { noremap = true, silent = true })

-- Exit insert
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>', { noremap = true, silent = true })

-- Somehow this prevents an annoying "Press ENTER or type a command to continue"
vim.opt.cmdheight = 2
