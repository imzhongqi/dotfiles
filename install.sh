#!/bin/bash

platform=$(uname -s | awk '{ print tolower($1) }')

check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

install-docker-compose() {
  echo "install docker-compose"
  version=${1:-1.25.5}
  curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)/" -o /tmp/docker-compose &&
  chmod +x /tmp/docker-compose &&
  sudo mv /tmp/docker-compose /usr/local/bin/docker-compose
}

install-docker() {
  echo "install docker"
  sudo apt-get update && 
  sudo apt-get -y install curl apt-transport-https ca-certificates software-properties-common &&
  (curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -) &&
  sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" &&
  sudo apt-get update &&
  sudo apt-get -y install docker-ce &&
  sudo usermod -aG docker $USER
}

install-golang() {
  echo "install golang"
  version=${1:-1.14.3}
  name="go${version}.${platform}-amd64.tar.gz"
  curl -L https://dl.google.com/go/$name -o /tmp/$name
  sudo tar xzf /tmp/$name -C /usr/local && rm /tmp/$name
}

install-node() {
  echo "install node"
  version=${1:-12.16.3}
  name=node-v${version}-${platform}-x64.tar.gz
  install_dir=$HOME/.local/share/node 
  curl -L https://nodejs.org/dist/v${version}/${name} -o /tmp/$name
  mkdir -p $install_dir && tar xzf /tmp/$name -C $install_dir --strip-components 1 && rm /tmp/$name
}

install-rust() {
  echo "install rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install-protoc() {
  echo "install protoc"
  version=${1:-3.12.1}
  name=protoc-${version}-linux-$(uname -p).zip
  curl -L https://github.com/protocolbuffers/protobuf/releases/download/v${version}/$name -o /tmp/$name
  sudo unzip -jq /tmp/$name bin/protoc -d /usr/local/bin && sudo chmod +rx /usr/local/bin/protoc
}

install-clang-format() {
  echo "install clang-format"
  check_cmd clang-format-9 || sudo apt install clang-format-9
  check_cmd clang-format-9 && (check_cmd clang-format || sudo ln -s `command -v clang-format-9` /usr/bin/clang-format)
}

install-bat() {
  echo "install bat"
  version=${1:-0.15.1}
  name=bat-v${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/sharkdp/bat/releases/download/v${version}/$name -o /tmp/$name
  sudo tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/bat --strip-components 1 --no-same-owner
}

install-fd() {
  echo "install fd"
  version=${1:-8.1.0}
  name=fd-v${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/sharkdp/fd/releases/download/v${version}/$name -o /tmp/$name
  sudo tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/fd --strip-components 1 --no-same-owner
}

install-fzf() {
  echo "install fzf"
  version=${1:-0.21.1}
  name=fzf-${version}-linux_amd64.tgz
  curl -L https://github.com/junegunn/fzf-bin/releases/download/${version}/$name -o /tmp/$name
  sudo tar xzf /tmp/$name -C /usr/local/bin --no-same-owner
}

install-rg() {
  echo "install rg"
  version=${1:-12.1.0}
  name=ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/BurntSushi/ripgrep/releases/download/${version}/$name -o /tmp/$name
  sudo tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/rg --strip-components 1 --no-same-owner
}

install-exa() {
  echo "install exa"
  version=${1:-0.9.0}
  name=exa-linux-x86_64-${version}.zip
  curl -L https://github.com/ogham/exa/releases/download/v0.9.0/$name -o /tmp/$name
  unzip -q /tmp/$name -d /tmp && sudo mv /tmp/${name%-$version*} /usr/local/bin/exa
}

main() {
  name=$1
  shift
  case "$name" in
    docker)
      install-docker $@
    ;;
    docker-compose)
      install-docker-compose $@
    ;;
    golang)
      install-golang $@
    ;;
    node)
      install-node $@
    ;;
    rust)
      install-rust $@
    ;;
    protoc)
      install-protoc $@
    ;;
    bat)
      install-bat $@
    ;;
    fd)
      install-fd $@
    ;;
    fzf)
      install-fzf $@
    ;;
    rg)
      install-rg $@
    ;;
    exa)
      install-exa $@
    ;;
    tools)
      install-exa
      install-bat
      install-fzf
      install-rg
      install-fd
    ;;
    clang-format)
      install-clang-format $@
    ;;
    *)
      echo "usage: $0 (docker|docker-compose|golang|nodejs|rust|protoc)"
    ;;
  esac
}

main "$@"
