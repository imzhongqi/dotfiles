export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh
skip_global_compinit=1

PROXY_ADDR="http://127.0.0.1:1080"
export GOPATH="$HOME/.local/go"

() {
  local USER_PATH=(
    /usr/local/go/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/.local/share/node/bin
    $HOME/.yarn/bin
    $GOPATH/bin
  )

  if [[ ! $PATH =~ $USER_PATH ]]; then
    export PATH=$(IFS=':'; echo "${USER_PATH[*]}"):$PATH
  fi
}

