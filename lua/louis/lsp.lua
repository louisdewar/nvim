local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local on_attach = require('louis.lsp.attach')
local capabilities = require('louis.lsp.capabilities')

local null_ls = require('null-ls')

require('trouble').setup({})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.codespell,
  },
  on_attach = on_attach,
  capabilities = capabilities
})

-- lsp_lines
vim.diagnostic.config({
  -- virtual_lines = { only_current_line = true },
  virtual_text = false
})

vim.keymap.set(
  "",
  "<Leader>l",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

-- TODO: add health check (or similar) to tell user to install eslint_d if not installed (npm install -g eslint_d)

vim.cmd([[autocmd BufRead Tiltfile set ft=tiltfile]])

lsp_status.register_progress()

local servers = {
  eslint = {},
  cssls = {},
  html = {},
  tilt_ls = {},
  yamlls = {},
  pyright = {},
  -- pylsp = {
  --   on_attach = function (prev_on_attach, client, bufnr)
  --     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  --     prev_on_attach(client, bufnr)
  --   end,
  --   settings = {
  --     -- formatCommand = { "black" },
  --     pylsp = {
  --       plugins = {
  --         pycodestyle = {
  --           -- ignore = {'W391'},
  --           -- maxLineLength = 100
  --         }
  --       },
  --     }
  --   }
  -- },
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
  ccls = {
    init_options = {
      compilationDatabaseDirectory = "build";
    }
  },
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        runtime = { version = 'LuaJIT' }, telemetry = { enable = false }
      }
    },
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
