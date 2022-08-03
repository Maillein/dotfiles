-- True Colorが使えるようになるおまじない
vim.opt.termguicolors = true
vim.cmd [[autocmd ColorScheme * highlight LineNr guifg=Gray]]
vim.cmd [[autocmd ColorScheme * highlight CursorLineNr guifg=Orange]]
vim.cmd [[autocmd ColorScheme * highlight clear CursorLine]]

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent = true
-- コメントの色を変更
vim.g.tokyonight_colors = { comment = 'green2' }

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]
