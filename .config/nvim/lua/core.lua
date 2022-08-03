-- 表示関連
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number = true
vim.opt.cursorline = true

-- マーカー文字列で折りたたむ
vim.opt.foldmethod = 'marker'

-- 長い行が折り返されないようにする
vim.opt.wrap = true

-- スプリットが右側に表示されるようにする
vim.opt.splitright = true

--  インデント
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- 保存してないファイルを閉じようとしたときに確認をする
vim.opt.confirm = true
