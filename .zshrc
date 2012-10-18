### .zshrc
export LANG=ja_JP.UTF-8

# 補完機能の強化
autoload -U compinit
compinit
<<<<<<< HEAD

# Option(man zshoptions)
setopt autopushd    # cd時に自動でpush
setopt auto_cd      # ディレクトリ名だけcd
setopt correct      # スペルチェック
setopt cdable_vars  # cd ..のときにリンクを辿らない

=======
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
>>>>>>> FETCH_HEAD
PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
