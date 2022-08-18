local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-rust"),
  }
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Run nearest test
map('n', '<leader>tr', neotest.run.run, opts)
-- Run tests in file
map('n', '<leader>tf', function ()
  neotest.run.run(vim.fn.expand("%"))
end, opts)
-- Cancel (stop) tests
map('n', '<leader>tc', neotest.run.stop, opts)
-- Attach to nearest tests
map('n', '<leader>ta', neotest.run.attach, opts)
-- Open test output
map('n', '<leader>to', neotest.output.open, opts)
-- Open test summary
map('n', '<leader>ts', neotest.summary.toggle, opts)
