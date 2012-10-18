### .zshrc
export LANG=ja_JP.UTF-8

# 補完機能の強化
autoload -U compinit
compinit

# Option(man zshoptions)
setopt autopushd    # cd時に自動でpush
setopt auto_cd      # ディレクトリ名だけcd
setopt correct      # スペルチェック
setopt cdable_vars  # cd ..のときにリンクを辿らない

PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
