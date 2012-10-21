### .zshrc
export LANG=ja_JP.UTF-8
PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH

# 補完機能の強化
autoload -U compinit
compinit

#処理に時間がかかった場合に自動的に処理時間を表示する
REPORTTIME=1

#常に -2 オプションで起動するように (強制的に端末が256色だと認識させる)
alias tmux='tmux -2'

#tmuxの自動起動
if [ -z "$PS1" ] ; then return ; fi

if [ -z $TMUX ] && [ $TERM != "screen" ]; then
  tmuxls=`tmux ls`
    if [ -z $tmuxls ] ; then
      tmux
    else
      tmux attach
    fi
fi

# Option(man zshoptions)
setopt autopushd    # cd時に自動でpush
setopt auto_cd      # ディレクトリ名だけcd
setopt correct      # スペルチェック
setopt cdable_vars  # cd ..のときにリンクを辿らない

