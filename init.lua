vim.g.mapleader = ' '

require('plugins')

require('general')
require('gui')
require('lsp')
require('file_explorer')
require('fzf')
-- Can't call this file cmp or else there will be an error, maybe create a folder for plugin configuration to avoid this issue
require('cmp_config')
require('rust')
require('status_line')
