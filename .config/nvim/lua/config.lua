-- Pythonのパス
vim.g.python_host_prog = vim.fn.expand('~/.local/share/virtualenvs/.nvim-python2-AaldqeR6/bin/python2')
vim.g.python3_host_prog = vim.fn.expand('~/.local/share/virtualenvs/.nvim-python3-Jmi4iJEZ/bin/python3')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('options')
require('keys')
require('plugins.tokyonight')
