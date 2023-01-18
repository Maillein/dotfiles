local api = vim.api

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')


local vars = {
  python3_host_prog = '/home/maillein-wm/.nvim-python3/bin/python3',
  loaded_matchparen = 1
}

for var, val in pairs(vars) do
  api.nvim_set_var(var, val)
end

require('core')
require('keymap')
require('color')
require('plugins.packer')
require('plugins.lualine')
require('plugins.fern')
require('plugins.caw')
require('plugins.telescope')
require('plugins.lsp-config')
require('plugins.mason')
require('plugins.nvim-cmp')
require('plugins.vsnip')
require('plugins.treesitter')
