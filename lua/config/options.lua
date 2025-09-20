local opt = vim.opt

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

opt.relativenumber = true
opt.number = true

-- Always show the signcolumn, otherwise it would shift the text each time
opt.signcolumn = "yes"

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Persist undo history to file (when file is written)
opt.undofile = true
opt.undolevels = 10000

-- Save swap file (ms) and trigger CursorHold
opt.updatetime = 200

-- Put new windows below/right of current
opt.splitbelow = true
opt.splitright = true

opt.list = true

-- TODO: decide
-- OR: set list listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
local space = "·"
opt.listchars:append({
  -- tab = "│─",
  multispace = space,
  -- lead = space,
  trail = space,
  nbsp = space,
})
