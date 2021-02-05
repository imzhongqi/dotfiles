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

function ap() {
  if [[ "$http_proxy" == "" || "$https_proxy" == "" ]]; then
    export {http,https}_proxy=${proxy_addr:-${proxy_protocol:-http}://${proxy_host:-127.0.0.1}:${proxy_port:-1080}}
    return
  fi
  unset {http,https}_proxy
}

