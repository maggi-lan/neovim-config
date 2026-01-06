-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Gruvbox theme
  use { "ellisonleao/gruvbox.nvim" }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Harpoon: file switcher
  use 'ThePrimeagen/harpoon'

  -- Undo tree visualizer
  use 'mbbill/undotree'

  -- File manager
  use 'nvim-tree/nvim-tree.lua'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Mason: language server manager
  use 'mason-org/mason.nvim'

  -- lspconfig: connects neovim to the language server
  use 'neovim/nvim-lspconfig'

  -- Bridges mason and lspconfig 
  use 'mason-org/mason-lspconfig.nvim'

  -- Telescope UI for LSP code actions
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Linter/Formatter
  use 'nvimtools/none-ls.nvim'
  use 'nvimtools/none-ls-extras.nvim'

  -- Commenter
  use 'numToStr/Comment.nvim'

  -- Greeter
  use {
    'goolord/alpha-nvim',
    requires = { {'nvim-tree/nvim-web-devicons'} },
  }
end)
