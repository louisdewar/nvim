local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local on_attach = require('lsp.attach');
local capabilities = require('lsp.capabilities');

lsp_status.register_progress()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach =

local servers = {
  pyright = {},
  --rust_analyzer = {},
  tsserver = {},
  ccls = {},
  sumneko_lua = {
    settings = { Lua = { telemetry = { enable = false } } }
  },
}


for server, extra_options in pairs(servers) do
  local options = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 50,
    },
    capabilities = capabilities,
  }


  for _, option in ipairs(extra_options) do
      table.insert(options, option)
  end

  nvim_lsp[server].setup(options)
end
