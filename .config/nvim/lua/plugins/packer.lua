-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- カラースキーム
  use 'folke/tokyonight.nvim'

  -- 括弧の補完
  use 'jiangmiao/auto-pairs'

  -- 括弧の編集
  use 'machakann/vim-sandwich'

  -- コメントアウト
  use 'tyru/caw.vim'

  -- ステータスラインをかっこよくするやつ
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- ファイラー
  use('lambdalisue/fern.vim')
  use('lambdalisue/fern-git-status.vim')
  use('lambdalisue/fern-hijack.vim')
  use {
    'lambdalisue/fern-renderer-nerdfont.vim',
    requires = { 'lambdalisue/nerdfont.vim' }
  }

  -- ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
