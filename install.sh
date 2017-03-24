#!/bin/bash

confirm () {
  read -r -p "$(tput bold)$1? (y/[N])$(tput sgr0) " RESPONSE
  case $RESPONSE in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

install () {
  install_alert $1
  [ ! -f $2 ] || mkdir -p $2
  if [ $3 ] ; then
    ln -sfiv $(pwd)/$1 $2
  else
    local LIST=$(find $1 -type f -exec basename {} \;)
    for ITEM in ${LIST[*]} ; do
      ln -sfiv $(pwd)/$1/$ITEM $2/$ITEM
    done
  fi
}

install_alert () {
  echo "\xF0\x9F\x8E\xB5  \033[1mInstall $1\033[0m"
}

install_already () {
  echo "\xF0\x9F\x8E\xB5  \033[1m$1 already installed\033[0m"
}

install_start() {
  echo "\xF0\x9F\x8E\xBC  \033[1mInstall start\033[0m"
}

install_complete() {
  echo "\xF0\x9F\x8E\xB6  \033[1mInstall complete!\033[0m"
}

DYWI="Do you want install"
