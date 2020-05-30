#!/bin/bash

sudo-nopasswd() {
  [[ -f /etc/sudoers.d/NOPASSWD ]] || sudo tee /etc/sudoers.d/NOPASSWD > /dev/null <<EOF
%sudo ALL=(ALL:ALL) NOPASSWD:ALL
EOF
}

update-aliyun-apt-source() {
  version_codename=${1:-`lsb_release -cs`}
  pushd /etc/apt > /dev/null 2>&1
  ([[ ! -f sources.list.bak ]] && [[ -f sources.list ]]) && sudo cp sources.list sources.list.bak
  sudo tee sources.list > /dev/null <<EOF
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
  sudo apt update
}

check-cmd() {
  command -v "$1" > /dev/null 2>&1
}

install-tools() {
  check-cmd zsh     ||  sudo apt-get -y install zsh
  check-cmd curl    ||  sudo apt-get -y install curl
  check-cmd wget    ||  sudo apt-get -y install wget
  check-cmd git     ||  sudo apt-get -y install git
  check-cmd stow    ||  sudo apt-get -y install stow
  check-cmd tmux    ||  sudo apt-get -y install tmux
  check-cmd unzip   ||  sudo apt-get -y install unzip
  check-cmd svn     ||  sudo apt-get -y install subversion
  check-cmd lua5.3  ||  sudo apt-get -y install lua5.3
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
      shift
      update-aliyun-apt-source $@
      ;;
    preinstall)
      install-tools
      ;;
    init)
      init-submodule
      ;;
    all)
      sudo-nopasswd
      update-aliyun-apt-source
      install-tools
      ;;
    *)
      echo "usage: sudo ./init.sh (sudo|apt|preinstall|init|all)"
      ;;
  esac
}

main "$@"
