#!/bin/bash

check-cmd() {
  command -v "$1" > /dev/null 2>&1
}

sudo-nopasswd() {
  [[ -f /etc/sudoers.d/NOPASSWD ]] || tee /etc/sudoers.d/NOPASSWD > /dev/null <<EOF
%sudo ALL=(ALL:ALL) NOPASSWD:ALL
EOF
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
  check-cmd stow    ||  pm stow
  check-cmd git     ||  pm git
  check-cmd svn     ||  pm subversion
  check-cmd lua5.3  ||  pm lua5.3

  check-cmd curl    ||  pm curl
  check-cmd wget    ||  pm wget
  check-cmd unzip   ||  pm unzip
}

main() {
  params=($@)
  for (( i=0; i<$#; i++)); do
    case "${params[i]}" in
      all)
        for v in $(ls -F | grep '/$' | sed 's#/##g'); do
          stow $v
        done
        break
        ;;
      *)
        stow "${params[i]}"
        ;;
    esac
  done
}

main "$@"