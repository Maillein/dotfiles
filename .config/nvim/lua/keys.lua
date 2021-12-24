local api = vim.api

api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = false})

api.nvim_set_keymap('n', '<C-_>', '<Plug>(caw:hatpos:toggle)', {noremap = false})
api.nvim_set_keymap('v', '<C-_>', '<Plug>(caw:hatpos:toggle)', {noremap = false})
