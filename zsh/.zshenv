export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export LANG="en_CN.UTF-8"

ZDOTDIR=$XDG_CONFIG_HOME/zsh
skip_global_compinit=1

export GOPATH=$HOME/.local/go 
export GOBIN=$GOPATH/bin

export LESSHISTFILE=/dev/null
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/startup.py
export SSH_PROXY=127.0.0.1:1081
export CHTSH=~/.config/cht.sh

export PATH=${(j.:.)$(cat $ZDOTDIR/.env)}:$PATH
