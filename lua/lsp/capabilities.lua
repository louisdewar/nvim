local lsp_status = require('lsp-status')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

return capabilities
