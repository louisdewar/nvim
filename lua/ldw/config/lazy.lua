-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Loads plugin specs
require("lazy").setup("ldw.plugins", {
  defaults = {
    -- Default to true and then manually fix broken plugins
    lazy = true,
  },
  install = {
    missing = true
  },
  change_detection = {
    notify = false
  }
})
