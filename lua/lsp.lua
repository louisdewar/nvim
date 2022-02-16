local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local on_attach = require('lsp.attach')
local capabilities = require('lsp.capabilities')

local null_ls = require('null-ls')

require('trouble').setup({})

-- vim.lsp.set_log_level('debug')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.eslint_d,
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.shellcheck,
  },
})

-- TODO: add health check (or similar) to tell user to install eslint_d if not installed (npm install -g eslint_d)

lsp_status.register_progress()

local servers = {
  eslint = {},
  pyright = {},
  tsserver = {
    on_attach = function(prev_on_attach, client, bufnr)
      if client.config.flags then
        client.config.flags.allow_incremental_sync = true
      end
      -- We want eslint to handle formatting
      client.resolved_capabilities.document_formatting = false

      prev_on_attach(client, bufnr)
    end,
  },
  ccls = {},
  sumneko_lua = {
    settings = { Lua = { telemetry = { enable = false } } },
  },
  texlab = {
    settings = {
      texlab = {
        build = {
          -- Maybe in the future:
          -- executable = 'tectonic',
          -- args = { '%f', '--synctex', '--keep-logs', '--keep-intermediates', '--outdir', 'out' },
          executable = 'latexmk',
          args = {
            '-pdf',
            '-shell-escape',
            '-interaction=nonstopmode',
            '-synctex=1',
            '-outdir=build',
            '%f',
          },
          onSave = true,
          forwardSearchAfter = true,
        },
        forwardSearch = {
          executable = 'zathura',
          args = { '--synctex-forward', '%l:1:%f', '%p' },
        },
        auxDirectory = 'build',
      },
    },
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

  if extra_options['on_attach'] ~= nil then
    local prev_on_attach = options['on_attach']
    options['on_attach'] = function(client, bufnr)
      extra_options['on_attach'](prev_on_attach, client, bufnr)
    end
  end

  options = vim.tbl_extend('keep', options, extra_options)

  nvim_lsp[server].setup(options)
end
