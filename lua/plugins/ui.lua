local function jj_status()
  local handle = io.popen("jj log -r @ --no-graph -T 'separate(\" \", change_id.short(8), bookmarks.map(|b| b.name().substr(0, 20)).join(\", \"), description.first_line().substr(0, 30))' 2>/dev/null")
  if not handle then return "" end
  local result = handle:read("*a")
  handle:close()
  return result:gsub("%s+$", "")
end

local function jj_diff()
  local handle = io.popen("jj diff --stat 2>/dev/null | tail -1")
  if not handle then return "" end
  local result = handle:read("*a")
  handle:close()
  local added, removed = result:match("(%d+) insertions?.-(%d+) deletions?")
  if not added then
    added = result:match("(%d+) insertions?") or "0"
    removed = "0"
  end
  if not removed then
    removed = result:match("(%d+) deletions?") or "0"
  end
  if added == "0" and removed == "0" then return "" end
  return "+" .. added .. " -" .. removed
end

local function is_jj_repo()
  return vim.fs.find(".jj", { upward = true, type = "directory" })[1] ~= nil
end

local function is_git_only()
  return not is_jj_repo()
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { jj_status, cond = is_jj_repo, icon = "󰊤" },
          { jj_diff, cond = is_jj_repo },
          { "branch", cond = is_git_only },
          { "diff", cond = is_git_only },
          "diagnostics",
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
