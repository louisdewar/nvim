local M = {}

M.configure_keybinds = function()
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
  vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>")
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action)
end

M.configure_servers = function()
  vim.lsp.config.biome.cmd = function(dispatchers, config)
    local biome_bin = require("neoconf").get("vscode.biome.lsp.bin")
    local biome_path = (config or {}).root_dir and vim.fs.joinpath(config.root_dir, biome_bin)
    if biome_path and vim.fn.executable(biome_path) == 1 then
      return vim.lsp.rpc.start({ biome_path, "lsp-proxy" }, dispatchers)
    end
    return vim.lsp.config.biome.cmd(dispatchers, config)
  end

  vim.lsp.enable({ "lua_ls", "biome", "ts_ls", "eslint", "tailwindcss" })
end

M.configure_lsp = function()
  M.configure_keybinds()
  M.configure_servers()

  vim.diagnostic.config({ virtual_text = true })
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "󰌵",
      },
    },
  })
end

return M
