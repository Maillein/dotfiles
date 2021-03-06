local api = vim.api

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')


local vars = {
  python_host_prog = '/home/maillein/.local/share/virtualenvs/.nvim-python2-AaldqeR6/bin/python2',
  python3_host_prog = '/home/maillein/.local/share/virtualenvs/.nvim-python3-Jmi4iJEZ/bin/python3',
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
require('plugins.masson')
require('plugins.nvim-cmp')
require('plugins.vsnip')
require('plugins.treesitter')
