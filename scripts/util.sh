#!/usr/bin/env bash

function search(){
  txt_=$1 #txt to search for
  file_=$2 #file or path to search
  [[ `grep -iRl "${txt_}" "${file_}"` ]] && echo true || echo false
  unset txt_ file_
}
function getOS(){
  OS="$(uname -s | cut -d '_' -f1)"
  if [[ $OS == "Darwin" ]]; then
    SYS="Mac"
  elif [[ $OS == "Cygwin" ]]; then
    SYS="Win"
  elif [[ $OS == "Linux" ]]; then
    SYS="Lin"
  elif [[ $OS == "MINGW64" ]]; then
    SYS="Win"
  else
    SYS="unknown"
  fi
  echo $SYS
}
function getDistro(){
  ID="$(cat /etc/*-release | grep DISTRIB_ID | cut -d "=" -f2)"
  if [[ $ID == "Ubuntu" ]]; then
    DIST="Deb"
  elif [[ $ID == "Debian" ]]; then
    DIST="Deb"
  elif [[ $ID == "Red" ]]; then
    DIST="RHEL"
  elif [[ $ID == "CentOS" ]]; then
    DIST="RHEL"
  else
    DIST="unknown"
  fi
  echo $DIST
}
function confirm(){
  # call with a prompt string or use a default
  read -r -p "${1:-Please choose [y/N]} " response
  case "${response}" in
      [yY][eE][sS]|[yY])
          ANS=true
          ;;
      *)
          ANS=false
          ;;
  esac
  echo $ANS
}
function gitConfig(){
  echo do some gitconfig
  read -r -p "${1:-Enter your full name} " NAME
  read -r -p "${1:-Enter your email address} " EMAIL

}
