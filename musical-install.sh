#!/bin/bash
#
# musical-install is shell library of helper functions
# for create install files with use musical emojis
#
# Mikhail Durmanov <madurmanov@gmail.com>

########################################
# Print start emoji 🎼
# Globals:
#   NONE
# Arguments:
#   TEXT
# Returns:
#   NONE
########################################
mi_start() {
  if [ $1 ] ; then
    echo "\xF0\x9F\x8E\xBC \033[1m$1\033[0m"
  else
    echo "\xF0\x9F\x8E\xBC \033[1mInstall start\033[0m"
  fi
}

########################################
# Print step emoji 🎵
# Globals:
#   NONE
# Arguments:
#   TEXT
# Returns:
#   NONE
########################################
mi_step () {
  echo "\xF0\x9F\x8E\xB5 \033[1m$1\033[0m"
}

########################################
# Print complete emoji 🎶
# Globals:
#   NONE
# Arguments:
#   TEXT
# Returns:
#   NONE
########################################
mi_complete() {
  if [ $1 ] ; then
    echo "\xF0\x9F\x8E\xB6 \033[1m$1\033[0m"
  else
    echo "\xF0\x9F\x8E\xB6 \033[1mInstall complete!\033[0m"
  fi
}

########################################
# Confirm actions by answer yes or no
# Globals:
#   RESPONSE
# Arguments:
#   ACTION
# Returns:
#   BOOLEAN
########################################
mi_confirm () {
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

########################################
# Create symbol links from to
# Globals:
#   PWD
# Arguments:
#   FROM
#   TO
#   RECURSIVE
# Returns:
#   NONE
########################################
mi_install () {
  mi_step "Install $1"
  if [ ! -f $2 ] ; then
    mkdir -p $2
  fi
  if [ $3 ] ; then
    local FILES=$(find $1 -type f -exec basename {} \;)
    for FILE in ${FILES[*]} ; do
      ln -sfiv $(PWD)/$1/$FILE $2/$FILE
    done
  else
    ln -sfiv $(PWD)/$1 $2
  fi
}
