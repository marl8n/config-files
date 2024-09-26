-- plugins.lua

-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin installation
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'ThePrimeagen/harpoon'
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-live-grep-args.nvim'}
      }
  }

  use 'nvim-telescope/telescop-harpoon.nvim'

  -- LSP and Autocompletion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Load custom configuration for plugin
  require('plugins.harpoon')

  -- Load custom configuration for plugin
  require('plugins.telescope')

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
