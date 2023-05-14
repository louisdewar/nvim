local g = vim.g
local opt = vim.opt

-- <leader> = space
g.mapleader = " "
g.maplocalleader = " "

-- Show relative line numbers + current line number
opt.relativenumber = true
opt.number = true
-- Use system clipboard
opt.clipboard = "unnamedplus"
-- Disable line wrap
opt.wrap = false
-- Put new windows below/right of current
opt.splitbelow = true
opt.splitright = true

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2

-- Show some invisible characters
opt.list = true
-- Automatic formatting options (see :help fo-table)
opt.formatoptions = "jcroqlnt"

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

opt.spelllang = { "en" }

opt.shortmess:append { I = true, c = true }

opt.showmode = false -- Dont show mode since we have a statusline

opt.termguicolors = true -- True color support

opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.completeopt = "menu,menuone,noselect"

opt.inccommand = "nosplit" -- preview incremental substitute

-- Lines of context (above/below cursor)
opt.scrolloff = 4
-- Columns of context (either side of cursor)
opt.sidescrolloff = 8

-- Persist undo history to file (when file is written)
opt.undofile = true
opt.undolevels = 10000

-- Save swap file (ms) and trigger CursorHold
opt.updatetime = 200

-- Disable statusline for last window
opt.laststatus = 0

opt.wildmode = "longest:full,full" -- Command-line completion mode

-- Hide * markup for bold and italic
-- opt.conceallevel = 3 

-- Useful for whichkey
opt.timeout = true
opt.timeoutlen = 300



-- TODO: investigate
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   opt.splitkeep = "screen"
--   opt.shortmess:append { C = true }
-- end
--

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 1000 }
  end,
})
