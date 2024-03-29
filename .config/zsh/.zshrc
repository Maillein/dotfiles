# 履歴ファイルの保存先
HISTFILE=$XDG_CACHE_HOME/zsh/history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

typeset -U path PATH
typeset -U ld_library_path LD_LIBRARY_PATH
typeset -U pkg_config_path PKG_CONFIG_PATH

path=("${HOME}/.cargo/bin" $path)
path=("${ZDOTDIR}/commands" $path)
# npm install -g に失敗しないようにする
# https://qiita.com/NaokiIshimura/items/cc07441939b226e779c6
path=("${HOME}/.npm-global/bin" $path)
if $(command -v nvcc); then
  path=("/usr/local/cuda-12.0/bin" $path)
  ld_library_path=("/usr/local/cuda-12.0/lib64" $ld_library_path)
fi
ld_library_path=("/usr/local/lib" $ld_library_path)
pkg_config_path=("/usr/local/lib/pkgconfig" $pkg_config_path)

export PATH
export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export TERM=wezterm
export TIMEFMT=$'========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n'
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/.ripgreprc

# zabrzeを読み込み
# https://ryooooooga.hateblo.jp/entry/2021/08/15/221759
eval "$(zabrze init --bind-keys)"

# sheldonを読み込み
eval "$(sheldon source)"

# プロンプト設定
source "${ZDOTDIR}/prompt.sh"

# Deleteキーが変なのを修正
bindkey "^[[3~" delete-char

