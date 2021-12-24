-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = "true"

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { comment = 'green2' }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
