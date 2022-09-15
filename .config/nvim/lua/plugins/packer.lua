-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- denops
  use 'vim-denops/denops.vim'

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
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
    -- config = function ()
    --   require('plugins.lsp-config')
    -- end,
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }

  -- 入力補完
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
  }

  -- vsnip
  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    -- commit = "07b7221",
    run = ":TSUpdate",
    -- config = function()
    --   require("plugin.treesitter")
    -- end,
  })
  use('p00f/nvim-ts-rainbow')

  -- ウィンドウのリサイズを簡単にする
  use 'simeji/winresizer'

  -- Markdownのプレビュー
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
