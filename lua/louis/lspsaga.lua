local saga = require('lspsaga')

saga.init_lsp_saga({
    -- move_in_saga = { prev = '<C-p>', next = '<C-n>' },
})

-- local lspsaga_action = require("lspsaga.codeaction")
local m = vim.keymap.set
local opts = { silent = true }

-- m("n", "<C-f>", function()
--     lspsaga_action.smart_scroll_with_saga(1)
-- end, { silent = true })
-- m("n", "<C-b>", function()
--     lspsaga_action.smart_scroll_with_saga(-1)
-- end, { silent = true })

m('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
m('n', '<space>gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
m('n', '<space>gs', '<cmd>Lspsaga signature_help<CR>', opts)

-- TODO: this doesn't seem to be working, anyway gd isn't the right binding for it
-- m('n', '<space>gd', '<cmd>Lspsaga preview_definition<CR>', opts)
m('n', '<space>rn', '<cmd>Lspsaga rename<CR>', opts)

m('n', '<leader>ac', '<cmd>Lspsaga code_action<CR>', opts)
