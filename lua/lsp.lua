local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local on_attach = require('lsp.attach');
local capabilities = require('lsp.capabilities');

local null_ls = require("null-ls")

null_ls.config({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.eslint_d
    }
})

-- -- TODO: add health check (or similar) to tell user to install eslint_d if not installed (npm install -g eslint_d)

lsp_status.register_progress()

local servers = {
  pyright = {},
  --rust_analyzer = {},
  tsserver = {
    on_attach = function(prev_on_attach, client, bufnr)
        if client.config.flags then
          client.config.flags.allow_incremental_sync = true
        end
        -- We want eslint to handle formatting
        client.resolved_capabilities.document_formatting = false

        prev_on_attach(client, bufnr)
      end
  },
  ccls = {},
  sumneko_lua = {
    settings = { Lua = { telemetry = { enable = false } } }
  },
  ['null-ls'] = {}
}


for server, extra_options in pairs(servers) do
  local options = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 50,
    },
    capabilities = capabilities,
  }

  if extra_options['on_attach'] ~= nil then
    local prev_on_attach = options['on_attach']
    options['on_attach'] = function(client, bufnr)
      extra_options['on_attach'](prev_on_attach, client, bufnr)
    end
  end

  vim.tbl_extend('keep', options, extra_options)
  for _, option in ipairs(extra_options) do
      table.insert(options, option)
  end

  nvim_lsp[server].setup(options)
end
