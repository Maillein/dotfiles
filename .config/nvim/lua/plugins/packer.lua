vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
    -- 自分自身を読み込む
    use {'wbthomason/packer.nvim', opt = true}

    -- カラースキーム
    use'folke/tokyonight.nvim'

    -- 括弧の補完
    use'jiangmiao/auto-pairs'

    -- コメントアウト
    use'tyru/caw.vim'

    -- treesitter
    use'nvim-treesitter/nvim-treesitter'
end)
