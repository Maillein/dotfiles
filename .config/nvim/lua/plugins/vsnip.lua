vim.g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/vsnip')

local opts = { expr = true, remap = true }
-- expend
vim.keymap.set('n', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)"    : <C-j>', opts)
vim.keymap.set('s', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)"    : <C-j>', opts)
-- Jump foward or backward
vim.keymap.set("i", "<C-l>", 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', opts)
vim.keymap.set("s", "<C-l>", 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', opts)
vim.keymap.set("i", "<C-h>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-next)" : "<C-h>"', opts)
vim.keymap.set("s", "<C-h>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-next)" : "<C-h>"', opts)
