require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- disable = { 'rust' },
    },
    indent = {
        enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
        disable = { 'rust' },
    },
    -- 括弧の色をネストごとに変更します。
    rainbow = {
      enable = true
    },
    ensure_installed = 'maintained'
}
