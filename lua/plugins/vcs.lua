return {
  {
    "nicolasgb/jj.nvim",
    version = "*",
    cmd = { "J", "Jdiff", "Jvdiff", "Jhdiff" },
    keys = {
      { "<leader>jl", function() require("jj.cmd").log() end, desc = "JJ log" },
      { "<leader>js", function() require("jj.picker").status() end, desc = "JJ status (picker)" },
      { "<leader>jd", function() require("jj.cmd").describe() end, desc = "JJ describe" },
      { "<leader>jb", function() require("jj.annotate").line() end, desc = "JJ blame line" },
      { "<leader>jh", function() require("jj.picker").file_history() end, desc = "JJ file history" },
      { "<leader>jo", function() require("jj.cmd").open_pr({ list_bookmarks = true }) end, desc = "JJ open PR (select bookmark)" },
    },
    opts = {},
  },
}
