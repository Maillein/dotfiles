# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

## 以下自分で追加した設定
export PATH=$HOME/.cargo/bin:$PATH

# sheldonを読み込み
eval "$(sheldon source)"

# zabrzeを読み込み
# https://ryooooooga.hateblo.jp/entry/2021/08/15/221759
eval "$(zabrze init --bind-keys)"
