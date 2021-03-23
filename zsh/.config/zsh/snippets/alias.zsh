# global alias
alias rm='rm -i'   rd='rmdir'   md='mkdir -p'
alias ls='exa -bh'  la='ls -la'  lt='ls --tree'  ll='ls -l'  l='ls'
alias dfh='df -h'  dus='du -sh' del='gio trash' dusa='dus --apparent-size'
alias reload="exec $SHELL -l -i"  grep="command grep --colour=auto --binary-files=without-match --directories=skip"
alias df='df -h'  du='du -h'  plast="last -20"
alias cp='cp -v'   mv='mv -v'

function _z() {
  _zlua "$@";
}

ap() {
  if (( $# > 0 )); then
    proxy_addr=$1 proxy 
    return
  fi
  is_proxy && unproxy || proxy
}

proxy() {
  export {http,https}_proxy=${proxy_addr:-http://localhost:${proxy_port:-1080}}
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
