local health = require('health')
local M = {}

-- TODO: finish this
M.check = function()
  health.report_start("Louis's custom config")
  health.report_ok("this is a test")

  local function check_vscode_lang_server(component)
    local fullname = string.format("vscode-%s-language-server", component)
    if vim.fn.has(fullname) == 1 then
      health.report_ok(string.format("%s is installed", fullname))
    else
      health.report_warn(string.format("%s is not installed or not in PATH", fullname), {"run npm i -g vscode-langservers-extracted"})
    end
  end
  check_vscode_lang_server("eslint")
  check_vscode_lang_server("css")
end

return M
