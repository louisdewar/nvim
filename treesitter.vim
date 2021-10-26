lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    -- The default for rust is better than tree-sitter
    disable = { "rust" },
  },
}
EOF
