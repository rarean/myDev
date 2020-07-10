#!/usr/bin/env bash

source ./scripts/adders.sh
source ./scripts/chkers.sh
source ./scripts/util.sh

function chocoPkgInstaller(){
  PKGS=${1}
  echo "install packages: ${PKGS[@]}"
}

function brewPkgInstaller(){
  PKGS=${1}
  #echo "install packages: ${PKGS[@]}"
  addBrew #ensure we have homebrew/linbrew installed first

  for ix in ${!PKGS[*]}
  do
    pkg=${PKGS[$ix]}
    echo
    printf "=========> Installing:  %s\n" "$pkg <========="
    add$pkg
    echo
  done
}

