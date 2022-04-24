export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh
skip_global_compinit=1

export GOPATH=$HOME/.local/go 
export GOBIN=$GOPATH/bin

() {
  local PATHS=(
    $HOME/.local/bin
    $GOBIN
    /usr/local/sbin
    /opt/homebrew/bin
  )
  export PATH=${(j.:.)PATHS}:$PATH
}

export LESSHISTFILE=/dev/null
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/startup.py
export SSH_PROXY=127.0.0.1:1081
export CHTSH=~/.config/cht.sh
