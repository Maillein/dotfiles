-- 行数を表示
vim.wo.number = true

-- インデント関連
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- 行の折返しをしない
vim.wo.wrap = false

-- マーカー文字列で折りたたむ
vim.wo.foldmethod = 'marker'

vim.cmd([[
" latexの設定
" Starting server for LaTeX inverse search.
function! s:myinversetex()
    if !filereadable('/tmp/sv4nvim' . expand("%:p"))
        call mkdir('/tmp/sv4nvim' . expand("%:p:h"),"p")
        call serverstart('/tmp/sv4nvim' . expand("%:p"))
    endif
endfunction
command! Serverorig call s:myinversetex()

augroup latex_new
" texソースのときに自動実行
autocmd!
autocmd BufRead *.tex Serverorig
autocmd BufRead *.ltx Serverorig
autocmd BufWritePost *.tex Serverorig
autocmd BufWritePost *.ltx Serverorig
augroup END
]])
-- -- Latexの設定
-- function myinversetex()
--     local filepath = '/tmp/sv4nvim'..vim.fn.expand('%:p')
--     local filehead = '/tmp/sv4nvim'..vim.fn.expand('%:p:h')
--     if not vim.fn.filereadable(filepath) then
--         vim.fn.mkdir(filehead, 'p')
--         vim.fn.serverstart(filepath)
--     end
-- end
-- 
-- -- texソースのときに自動実行
-- vim.cmd('augroup latex_new')
-- vim.cmd('autocmd!')
-- vim.cmd('autocmd BufRead *.tex lua myinverstex()')
-- vim.cmd('autocmd BufRead *.ltx lua myinverstex()')
-- vim.cmd('autocmd BufWritePost *.tex lua myinverstex()')
-- vim.cmd('autocmd BufWritePost *.ltx lua myinverstex()')
-- vim.cmd('augroup END')
