vim.o.termguicolors = true

vim.cmd([[colorscheme gruvbox]])
-- Some things aren't supported in gruvbox
vim.cmd([[
  highlight! link TSInclude GruvboxRed
]])

-- vim.cmd[[colorscheme neon]]

-- Make background transparent
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
