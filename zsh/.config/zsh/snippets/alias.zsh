# function _z() {
#   _zlua "$@";
# }
#
command_check() {
	command -v $1 &>/dev/null
}

command_check exa && alias ls='exa -bh'
command_check bat && alias cat='bat --plain'

# global alias
alias rm='rm -i'   rd='rmdir'   md='mkdir -p'
alias la='ls -la'  lt='ls --tree'  ll='ls -l'  l='ls'
alias dfh='df -h'  dus='du -sh' del='gio trash' dusa='dus --apparent-size'
alias reload="exec $SHELL -l -i"  grep="command grep --colour=auto --binary-files=without-match --directories=skip"
alias df='df -h'  du='du -h'  plast="last -20"
alias cp='cp -v'   mv='mv -v'
alias ts='date +%s'

proxy() {
  if [[ "$1" != "" ]]; then
    local proxy_addr="$1"
  fi
  export {http,https}_proxy="${proxy_addr:-http://localhost:"${proxy_port:-1080}"}"
  echo "proxy on: $http_proxy"
}

unproxy() {
  unset {http,https}_proxy
  echo "proxy off"
}

is_proxy() {
  if [[ "$http_proxy" == "" || "$https_proxy" == "" ]]; then
    return 1
  fi
}

ap() {
  case $1 in
    status | s)
      if is_proxy; then
        echo "status: on, proxy address $http_proxy"
      else
        echo "status: off"
      fi
      ;; 

    on)
      proxy "$2"
      ;;

    off)
      unproxy
      ;;

    "")
      is_proxy && unproxy || proxy
      ;;

    *)
      echo "error: unknown arguments"
      ;;
  esac
}
