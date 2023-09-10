local M = {}

M.servers = {
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        procMacros = {
          enable = true
        },
        cargo = {
          allFeatures = true
        },
        checkOnSave = {
          command = "clippy",
          -- To prevent check on save taking a lock on the target dir (blocking cargo build/run)
          extraArgs = { "--target-dir", "target/ra-check" },
        }
      }
    }
  },
  lua_ls = {
    telemetry = {
      enable = false,
    }
  },
  tsserver = {
    allow_formatting = false,
  },
  eslint = {
    on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {},
            maxLineLength = 200
          }
        }
      }
    }
  },
  terraform_lsp = {
    cmd = { "terraform-ls", "serve" },
  },
  ccls = {},
}

function M.default_on_attach(client, buf)
  -- Plugin specific extensions (if applicable)]
  local server = M.servers[client.name] or {}

  require("ldw.plugins.lsp.format").on_attach(client, buf, server)
  require("ldw.plugins.lsp.keymaps").on_attach(client, buf, server)

  if server.on_attach then
    server.on_attach(client, buf)
  end
end

-- Create an autocmd to run on LspAttach that runs the default on_attach action
function M.on_attach_autocmd(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

-- function M.get_servers()
-- end

function M.configure_servers()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp")
      .default_capabilities(vim.lsp.protocol.make_client_capabilities())

  for server, extra_options in pairs(M.servers) do
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, extra_options or {})

    if server_opts['on_attach'] ~= nil then
      local original_on_attach = server_opts['on_attach']
      server_opts['on_attach'] = function(client, bufnr)
        original_on_attach(client, bufnr)
        M.default_on_attach(client, bufnr)
      end
    else
      server_opts['on_attach'] = M.default_on_attach
    end

    lspconfig[server].setup(server_opts)
  end
end

return M
