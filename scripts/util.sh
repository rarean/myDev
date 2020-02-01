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
