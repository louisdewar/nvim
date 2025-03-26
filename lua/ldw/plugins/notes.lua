return {
  "nvim-neorg/neorg",
  lazy = false,
  build = ":Neorg ",
  version = "*",
  opts = {
    load = {
      ["core.defaults"] = {},
      -- ["core.neorg.concealer"] = {},
    }
  },
}
