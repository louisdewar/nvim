vim.cmd([[colorscheme gruvbox]])

-- Make background transparent
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
