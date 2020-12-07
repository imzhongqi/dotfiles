#!/bin/bash

PLATFORM=$(uname -s | awk '{ print tolower($1) }')

check_platform() {
	if [[ "$PLATFORM" != ${1:?PLATFORM must be set} ]]; then
		echo "PLATFORM must be $1"
		exit 1
	fi
}


check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

install-docker-compose() {
  echo "install docker-compose"
  version=${1:-1.25.5}
  curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)/" -o /tmp/docker-compose &&
  chmod +x /tmp/docker-compose &&
  mv /tmp/docker-compose /usr/local/bin/docker-compose
}

install-docker() {
	check_platform linux
  echo "install docker"
  apt-get update && 
  apt-get -y install curl apt-transport-https ca-certificates software-properties-common &&
  (curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add -) &&
  add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" &&
  apt-get update &&
  apt-get -y install docker-ce &&
  usermod -aG docker $USER
}

install-golang() {
  echo "install golang"
  version=${1:-1.14.3}
  name="go${version}.${PLATFORM}-amd64.tar.gz"
  curl -L https://dl.google.com/go/$name -o /tmp/$name &&
  tar xzf /tmp/$name -C /usr/local && rm /tmp/$name
}

install-node() {
  echo "install node"
  version=${1:-12.16.3}
  name=node-v${version}-${PLATFORM}-x64.tar.gz
  install_dir=$HOME/.local/share/node 
  curl -L https://nodejs.org/dist/v${version}/${name} -o /tmp/$name &&
  mkdir -p $install_dir &&
  tar xzf /tmp/$name -C $install_dir --strip-components 1 &&
  rm /tmp/$name
}

install-rust() {
  echo "install rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

install-protoc() {
  echo "install protoc"
  version=${1:-3.12.1}
  name=protoc-${version}-linux-$(uname -p).zip
  curl -L https://github.com/protocolbuffers/protobuf/releases/download/v${version}/$name -o /tmp/$name &&
  unzip -jq /tmp/$name bin/protoc -d /usr/local/bin &&
  chmod +rx /usr/local/bin/protoc
}

install-clang-format() {
  echo "install clang-format"
  check_cmd clang-format-9 || apt install clang-format-9
  check_cmd clang-format-9 && (check_cmd clang-format || ln -s `command -v clang-format-9` /usr/bin/clang-format)
}

install-bat() {
  echo "install bat"
  version=${1:-0.15.1}
  name=bat-v${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/sharkdp/bat/releases/download/v${version}/$name -o /tmp/$name &&
  tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/bat --strip-components 1 --no-same-owner
}

install-fd() {
  echo "install fd"
  version=${1:-8.1.0}
  name=fd-v${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/sharkdp/fd/releases/download/v${version}/$name -o /tmp/$name &&
  tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/fd --strip-components 1 --no-same-owner
}

install-fzf() {
  echo "install fzf"
  version=${1:-0.24.4}
  name=fzf-${version}-${PLATFORM}_amd64.tar.gz
	url=https://github.com/junegunn/fzf/releases/download/${version}/$name
	echo "download_url: $url"
  curl -L $url  -o /tmp/$name &&
  tar xzf /tmp/$name -C /usr/local/bin
}

install-rg() {
  echo "install rg"
  version=${1:-12.1.0}
  name=ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz
  curl -L https://github.com/BurntSushi/ripgrep/releases/download/${version}/$name -o /tmp/$name &&
  tar xzf /tmp/$name -C /usr/local/bin ${name%.tar.gz}/rg --strip-components 1 --no-same-owner
}

install-exa() {
  echo "install exa"
  version=${1:-0.9.0}
	local platform="$PLATFORM"
	if [[ $platform == "darwin" ]]; then
		platform="macos"
	fi
	name=exa-${platform}-$(uname -m)-${version}.zip
	url=https://github.com/ogham/exa/releases/download/v0.9.0/$name
	echo "download_url: $url"
  curl -L $url -o /tmp/$name &&
  unzip -q /tmp/$name -d /tmp &&
  mv /tmp/${name%-$version*} /usr/local/bin/exa
}

main() {
  subcommand=$1
  shift
  case "$subcommand" in
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
      echo "usage: $0 (docker|docker-compose|golang|node|rust|protoc|clang-format)"
    ;;
  esac
}

main "$@"
