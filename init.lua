vim.g.mapleader = ' '

require('louis.plugins')

require('louis.general')
require('louis.gui')
require('louis.lsp')
require('louis.file_explorer')
require('louis.fzf')

-- Can't call this file cmp or else there will be an error, maybe create a folder for plugin configuration to avoid this issue
require('louis.cmp_config')
require('louis.trouble_config')
require('louis.treesitter_config')
require('louis.telescope_config')

require('louis.rust')
require('louis.status_line')
require('louis.notes')
require('louis.tabs')
