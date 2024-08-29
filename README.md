# Neovim Configuration Guide

This guide will walk you through setting up Neovim with `Packer` as the plugin manager. It will also configure essential plugins like NERDTree and LSP support.

## Prerequisites

1. **Install Neovim**
   Ensure Neovim is installed. You can install it using your system's package manager:

   - **macOS** (using Homebrew):  
     brew install neovim

   - **Ubuntu/Debian**:  
     sudo apt install neovim

   - **Arch Linux**:  
     sudo pacman -S neovim

2. **Install `Packer`**
   Packer is a Neovim plugin manager written in Lua. To install it, run the following commands:

   - Linux/macOS:  
     git clone --depth 1 https\\://github.com/wbthomason/packer.nvim \~/.local/share/nvim/site/pack/packer/start/packer.nvim

   - Windows (PowerShell):  
     git clone --depth 1 https\\://github.com/wbthomason/packer.nvim $HOME\\AppData\\Local\\nvim\\site\\pack\\packer\\start\\packer.nvim

## Setting Up Neovim

1. **Configure `init.lua`**
   Create a new `init.lua` file inside `\~/.config/nvim/` with the following content:

   ```lua
   -- Initialize Packer
   vim.cmd.packadd('packer.nvim')
   require('packer').startup(function(use)
     -- Packer manages itself
     use 'wbthomason/packer.nvim'
     
     -- NERDTree file explorer
     use 'preservim/nerdtree'
     
     -- LSP configurations
     use 'neovim/nvim-lspconfig'
   end)

   -- Set Spacebar as the leader key
   vim.g.mapleader = ' '

   -- NERDTree keybinding
   vim.api.nvim_set_keymap('n', '<leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

   -- LSP Configuration (example for Lua)
   local lspconfig = require('lspconfig')
   lspconfig.lua_ls.setup({})

   2.	Install Plugins
Open Neovim and run the following command to install the plugins:
:PackerInstall
	3.	Install vim-plug (if needed for other setups)
If you prefer vim-plug, you can install it as follows:
	•	Linux/macOS:
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim –create-dirs https\://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	•	Windows (PowerShell):
iwr -useb https\://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME\AppData\Local\nvim\autoload\plug.vim -Force

Using the Configuration

	1.	Opening Neovim
Once the plugins are installed, restart Neovim. You should now have access to the configured leader key, NERDTree toggle, and LSP support.
	2.	Working with NERDTree
Use <Space>nt to toggle NERDTree in Neovim.
	3.	LSP Support
The configuration provides LSP support for Lua by default. You can extend this to other languages by configuring additional LSP servers.

Managing Plugins

	•	Install Plugins:
:PackerInstall
	•	Update Plugins:
:PackerUpdate
	•	Remove Unused Plugins:
:PackerClean
	•	Compile Changes:
:PackerCompile
