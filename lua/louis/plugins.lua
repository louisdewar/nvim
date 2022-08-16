-- Bootstraps packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd([[packadd packer.nvim]])

-- Auto recompile packages whenever this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Packages to consider adding:
-- - tpope/vim-surround

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- MISC
  use('lewis6991/impatient.nvim')
  use('nvim-lua/plenary.nvim')
  use({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
          toggler = {
            line = "<leader>/"
          },
          opleader = {
            line = "<leader>/"
          }
        })
    end
  })
  use({ "williamboman/mason.nvim" })

  -- TODO: add descriptions to keymaps to make this useful + figure out errors
  -- once this is fixed consider adding:
  -- nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
  use({
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  })

  -- Useful for debugging treesitter syntax
  -- use 'nvim-treesitter/playground'

  -- GUI
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })
  use('folke/tokyonight.nvim')
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  })
  use('machakann/vim-highlightedyank')
  use('folke/lsp-colors.nvim')

  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use({'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'})

  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
        space_char_blankline = " "
      })
    end
  })
  use('ntpeters/vim-better-whitespace')  -- QOL
  use('tpope/vim-sleuth')
  use('andymass/vim-matchup')

  use({
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = vim.fn['fzf#install()'],
    },
  })

  -- LSP (base)
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('jose-elias-alvarez/null-ls.nvim')
  use('nvim-lua/lsp-status.nvim')
  use('onsails/lspkind-nvim')

  use({
    "https://github.com/Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  use("glepnir/lspsaga.nvim")

  -- LSP (languages)
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')
  use('mfussenegger/nvim-dap')
  use('simrat39/rust-tools.nvim')

  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- Notes
  use({
    'nvim-neorg/neorg-telescope',
  })
  use({
    'nvim-neorg/neorg',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Syntax
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  })
  use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
