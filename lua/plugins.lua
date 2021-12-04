-- Bootstraps packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- local packer_bootstrap = false

if fn.empty(fn.glob(install_path)) > 0 then
  -- packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

-- Auto recompile packages whenever this file is changed
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])


return require('packer').startup(function(use)

  use 'nvim-lua/plenary.nvim'

  use 'morhetz/gruvbox'
  --use 'arcticicestudio/nord-vim'

  use 'neovim/nvim-lspconfig'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- for file icons
    },
  }

  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = vim.fn['fzf#install()'],
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use 'tpope/vim-sleuth'
  use 'andymass/vim-matchup'
  -- TODO: learn and use:
  -- use 'tpope/vim-surround'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'mfussenegger/nvim-dap'
  use 'simrat39/rust-tools.nvim'

  use 'nvim-lua/lsp-status.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  --if packer_bootstrap then
  --  require('packer').sync()
  --end
end)
