" {{{ dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/maillein/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '.config/nvim/dein')
    " Required:
    call dein#begin('/home/maillein/.cache/dein')

    call dein#load_toml('/home/maillein/.config/nvim/dein.toml', {'lazy':0})
    call dein#load_toml('/home/maillein/.config/nvim/dein_lazy.toml', {'lazy':1})

    " Required:
    call dein#end()
    call dein#save_state()
endif




" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
" }}}

"{{{ 表示関連
syntax on
filetype plugin indent on
set number

" 勝手に折りたたまれないようにする
" set nofoldenable

" マーカー文字列で折りたたむ
set foldmethod=marker
"}}}

"{{{ カラースキーム
" True Color を使えるようになるおまじない
set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_transparent = "true"
let g:tokyonight_colors = { 'comment': 'green2' }
colorscheme tokyonight
" colorscheme jellybeans
" colorscheme hybrid
" colorscheme tender
" colorscheme elly
" }}}

"{{{ インデント関連
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
" }}}

" {{{ キーバインド
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" Escでターミナルから抜ける
tnoremap <Esc> <C-\><C-n>
" }}}

"Pythonのパス
let g:python_host_prog = expand('~/.local/share/virtualenvs/.nvim-python2-AaldqeR6/bin/python2')
let g:python3_host_prog = expand('~/.local/share/virtualenvs/.nvim-python3-Jmi4iJEZ/bin/python3')

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
