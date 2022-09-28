-- True Colorが使えるようになるおまじない
vim.opt.termguicolors = true
vim.cmd [[autocmd ColorScheme * highlight LineNr guifg=Gray]]
vim.cmd [[autocmd ColorScheme * highlight CursorLineNr guifg=Orange]]
vim.cmd [[autocmd ColorScheme * highlight clear CursorLine]]

require('tokyonight').setup({
  style = 'night',
  transparent = true,
  terminal_colors = true,
  on_colors = function(colors)
    -- コメントの色を変更
    colors.comment = colors.green2
  end
})

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- 括弧を強調
-- vim.opt.showmatch = true
-- vim.opt.matchtime = 1
