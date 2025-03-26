local M = {}

local format = require("ldw.plugins.lsp.format").format
local server_conf_allows_formatting = require("ldw.plugins.lsp.format").server_conf_allows_formatting

-- Keybinds for on_attach:
-- If the keybind includes the "has" field, then it only gets activated if the lsp client has "{has}Provider"
--
-- See
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
-- which lists server capabilities
M.keybinds = {
  { "gd",         vim.lsp.buf.definition,              desc = "Goto Definition", has = "definition" },
  { "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "References",      has = "references" },
  { "<leader>ac", vim.lsp.buf.code_action,             desc = "Code action",     has = "codeAction" },
  { "<leader>f",  format,                              desc = "Format",          has = "documentFormatting",      filter = server_conf_allows_formatting },
  { "<leader>f",  format,                              desc = "Format (Range)",  has = "documentRangeFormatting", filter = server_conf_allows_formatting, mode = "v" },
  { "K",          vim.lsp.buf.hover,                   desc = "Hover",           has = "hover" },
  { "<leader>rn", vim.lsp.buf.rename,                  desc = "Rename",          has = "rename" },
}

function M.on_attach(client, buffer, server_conf)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {} ---@type table<string,LazyKeys|{has?:string, filter?: function}>

  for _, value in ipairs(M.keybinds) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  -- Some servers have dynamically registered capabilities, I don't want to handle that properly right now because
  -- there might be some changes in nvim to make that easier in future, so I'll add a config option that lets me do
  -- it manually for language servers that I specify.
  local additional_capabilities = server_conf.additional_capabilities or {}

  for _, keys in pairs(keymaps) do
    if (not keys.filter or keys.filter(server_conf))
        and (not keys.has or client.server_capabilities[keys.has .. "Provider"] or vim.list_contains(additional_capabilities, keys.has)) then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.filter = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
    end
  end
end

return M
