vim.o.termguicolors = true

vim.g.tokyonight_style = "night"
vim.g.tokyonight_dark_sidebar = false
vim.cmd([[colorscheme tokyonight]])

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
})

vim.api.nvim_set_keymap('n', '<A-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Some things aren't supported in gruvbox
-- vim.cmd([[
--   highlight! link TSInclude GruvboxRed
-- ]])

-- vim.cmd[[colorscheme neon]]

-- Make background transparent
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('hi clear SignColumn')
-- vim.cmd('hi GruvboxGreen guibg=NONE')

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
