local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = 'all',

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    -- disable = { 'latex' },
  },

  indent = {
    enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
    disable = { 'rust' },
  },
})
