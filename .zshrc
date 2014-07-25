# .zshrc
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/sbin:$PATH
eval "$(rbenv init -)"

alias tmux='tmux -2'

if [ -z "$PS1" ] ; then return ; fi
if [ -z $TMUX ] && [ $TERM != "screen" ]; then
  tmuxls=`tmux ls`
    if [ -z $tmuxls ] ; then
      tmux
    else
      tmux attach
    fi
fi

autoload -U compinit

setopt autopushd
setopt auto_cd
setopt correct
setopt list_packed
setopt cdable_vars

PROMPT='%B%F{yellow}>w</ < %f%b'
RPROMPT='%B%F{blue}%n@%m[%~]%f%b'  

fpath=(/usr/local/share/zsh-completions $fpath)
compinit
zstyle ':completion:*:default' menu select=1
