#!/bin/bash

sudo-nopasswd() {
  [[ -f /etc/sudoers.d/NOPASSWD ]] || tee /etc/sudoers.d/NOPASSWD > /dev/null <<EOF
%sudo ALL=(ALL:ALL) NOPASSWD:ALL
EOF
}

update-aliyun-apt-source() {
  if [ `uname -s` != 'Linux' ]; then
    echo "operating system must be Linux (Ubuntu)."
    exit 1
  fi
  version_codename=${1:-`lsb_release -cs`}
  pushd /etc/apt > /dev/null 2>&1
  ([[ ! -f sources.list.bak ]] && [[ -f sources.list ]]) && cp sources.list sources.list.bak
  tee sources.list > /dev/null <<EOF
deb http://mirrors.aliyun.com/ubuntu/ ${version_codename} main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${version_codename} main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ ${version_codename}-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${version_codename}-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ ${version_codename}-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${version_codename}-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ ${version_codename}-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${version_codename}-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ ${version_codename}-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ ${version_codename}-backports main restricted universe multiverse
EOF
  popd > /dev/null 2>&1
  apt update
}

check-cmd() {
  command -v "$1" > /dev/null 2>&1
}

pm_command="apt-get install -y"

case `uname -s` in
  "Linux")
    pm_command="apt-get install -y"
  ;;
  "Darwin")
    pm_command="brew install"
  ;;
  *)
    echo "Unknown operating system."
    exit 1;
  ;;
esac

pm() {
  eval $pm_command $*
}

install-tools() {
  check-cmd zsh     ||  pm zsh
  check-cmd curl    ||  pm curl
  check-cmd wget    ||  pm wget
  check-cmd git     ||  pm git
  check-cmd stow    ||  pm stow
  check-cmd tmux    ||  pm tmux
  check-cmd unzip   ||  pm unzip
  check-cmd svn     ||  pm subversion
  check-cmd lua5.3  ||  pm lua5.3
}

init-submodule() {
  git submodule update --init
}

main() {
  case $1 in
    sudo)
      sudo-nopasswd
      ;;
    apt)
      update-aliyun-apt-source
      ;;
    preinstall)
      install-tools
      ;;
    init)
      init-submodule
      ;;
    *)
      echo "usage: ./init.sh (sudo|apt|preinstall|init)"
      ;;
  esac
}

main "$@"
