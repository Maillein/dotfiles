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


export PATH=~/.cargo/bin:$PATH
# npm install -g に失敗しないようにする
# https://qiita.com/NaokiIshimura/items/cc07441939b226e779c6
export PATH=~/.npm-global/bin:$PATH

# zabrzeを読み込み
# https://ryooooooga.hateblo.jp/entry/2021/08/15/221759
eval "$(zabrze init --bind-keys)"

# sheldonを読み込み
eval "$(sheldon source)"

autoload -U colors; colors
function left_prompt {
  if [ -n "$SSH_CONNECTION" ]; then
    # ssh接続中の処理
    local ssh_usr="%{${fg[magenta]}%}%n@%m%{$reset_color%}"
    local color="%(?.green.red)"
    local dir="%(5~,%-2~/.../%2~,%~)"
    PROMPT="${ssh_usr}%F{color}${dir}%{$reset_color%}%# "
  else
    # sshではない時の処理
    local color="%(?.green.red)"
    local dir="%(5~,%-2~/.../%2~,%~)"
    PROMPT="%F{${color}}${dir}%k%f%# "
  fi
}

function right_prompt {
  local branch_name=`git rev-parse --abbrev-ref @ 2> /dev/null`
  if [[  -n $branch_name  ]] then
    # git管理フォルダ内
    local git_status=`git status 2> /dev/null`
    local fgcolor bgcolor bgcolor2
    if [[ -n `echo "$git_status" | grep "^rebase in progress"` ]] then
      # コンフリクトが起こった状態
      fgcolor="%F{red}"
      branch_name="CONFLICT"
    elif [[ -n `echo "$git_status" | grep "^Unmerged paths"` ]] then
      # 自動マージできないファイルがある状態
      if [[ -n `echo "$git_status" | grep "Changes to be committed:"` ]] then
        # ステージングされているファイルが存在
        fgcolor="%F{white}"
        bgcolor="%K{red}"
        bgcolor2="%k"
      else
        fgcolor="%F{red}"
      fi
    elif [[ -n `echo "$git_status" | grep "Changes to be committed:"` ]] then
      # ステージングファイルがある状態
      # 新規ファイル、リネーム、削除ファイルがある場合はマゼンタ塗りつぶし
      # ステージング部分の文字列のみ抽出し、そこに特定の文字が含まれているかどうか
      fgcolor="%F{black}"
      bgcolor2="%k"
      if [[ -n `echo "$git_status" | awk '/Changes to be committed:/,/(Changes not staged for commit:|Untracked files:)/' | grep -e "new file:" -e "deleted:" -e "renamed:"` ]] then
        bgcolor="%K{magenta}"
      else
        bgcolor="%K{yellow}"
      fi
    elif [[ -n `echo "$git_status" | grep -e "Untracked files:" -e "deleted:"` ]] then
      # 新規ファイル、リネーム、削除ファイルがある状態
      fgcolor="%F{magenta}"
    elif [[ -n `echo "$git_status" | grep -e "modified"` ]] then
      # 更新されたファイルがある状態
      fgcolor="%F{yellow}"
    elif [[ -n `echo "$git_status" | grep -e "^nothing to commit"` ]] then
      # pushされていなければ塗りつぶし
      if [[ -n `git log origin/"$branch_name".."$branch_name"` ]] then
        fgcolor="%F{black}"
        bgcolor="%K{green}"
        bgcolor2="%k"
      else
        fgcolor="%F{green}"
      fi
    else
      fgcolor="%F{white}"
    fi
    RPROMPT="%{${bgcolor}${fgcolor}%}[${branch_name}]%F${bgcolor2}"
  else
    RPROMPT="%{${fg[green]}%}[%*]%{$reset_color%}"
  fi
}

autoload -Uz add-zsh-hook
PERIOD=1 # gitディレクトリでのright_promptは描画にやや負荷がかかるため1秒以内はキャッシュしたものを使う
add-zsh-hook periodic right_prompt
add-zsh-hook precmd left_prompt
