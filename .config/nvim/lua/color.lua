-- True Colorが使えるようになるおまじない
vim.opt.termguicolors = true

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent = true
-- コメントの色を変更
vim.g.tokyonight_colors = { comment = 'green2' }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
