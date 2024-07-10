-- -- Adapted from: https://github.com/rafi/neoconf-venom.nvim/blob/master/lua/venom.lua
local M = {}

local Util = require("neoconf.util")
local Job = require("plenary.job")

function M.find_python(cwd)
  if vim.fn.executable("poetry") == 1 then
    local stderr = {}
    local stdout, ret = Job:new({
      command = "poetry",
      args = { "env", "list", "--full-path" },
      cwd = cwd,
      on_stderr = function(_, data)
        table.insert(stderr, data)
      end,
    }):sync()

    if ret == 0 then
      return stdout[1] .. "/bin/python"
    end
    -- if #stderr > 0 then
    --   Util.error(
    --     string.format("Erroneous shell output from %s: %s",
    --       command, vim.inspect(stderr))
    --   )
    -- end
  end
end

return M
