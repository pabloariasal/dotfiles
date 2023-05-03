local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'vim-scripts/ReplaceWithRegister'
  use 'romainl/vim-qf'
  use 'vifm/vifm.vim'
  use 'markonm/traces.vim'
  use 'ludovicchabant/vim-gutentags'
  use 'lewis6991/gitsigns.nvim'
  use 'neovim/nvim-lspconfig'
  use 'aperezdc/vim-template'
  use 'szw/vim-maximizer'
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'dcampos/nvim-snippy'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'pabloariasal/alternate.nvim'
  use 'takac/vim-hardtime'
  use {
  "AckslD/nvim-neoclip.lua",
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup({enable_persistent_history = true,})
    end,
  }
  use {
  'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'f3fora/cmp-spell'},
    }
  }
  -- colors
  use 'morhetz/gruvbox'
  use 'shaunsingh/solarized.nvim'
  use 'dracula/vim'
  use {
      "catppuccin/nvim",
      as = "catppuccin",
  }
  use 'mhartington/oceanic-next'
  use {
    'https://gitlab.com/__tpb/monokai-pro.nvim',
    as = 'monokai-pro.nvim'
  }
  use 'arcticicestudio/nord-vim'
  use 'NLKNguyen/papercolor-theme'
  use 'junegunn/seoul256.vim'
  use 'folke/tokyonight.nvim'
  use 'connorholyday/vim-snazzy'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
