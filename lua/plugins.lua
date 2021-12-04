-- Bootstraps packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

  use 'tpope/vim-sleuth'
  use 'andymass/vim-matchup'
  -- TODO: learn and use:
  -- use 'tpope/vim-surround'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  use 'simrat39/rust-tools.nvim'

  if packer_bootstrap then
    -- Something wrong with this, packer_bootstrap seems to constantly be true
    --require('packer').sync()
  end
end)
