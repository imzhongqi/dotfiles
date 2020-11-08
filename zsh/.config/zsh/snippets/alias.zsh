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

function proxy() {
  export {http,https}_proxy="${PROXY_ADDR:-http://127.0.0.1:1080}"
}

function unproxy() {
  unset {http,https}_proxy
}

function fk() {
  proxy
  "$@"
  unproxy
}

function start() {
  sudo service $1 start
}

function stop() {
  sudo service $1 stop
}

