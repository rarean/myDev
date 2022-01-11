#!/usr/bin/env bash

source ./scripts/adders.sh
source ./scripts/chkers.sh
source ./scripts/util.sh

function projectChoise(){
  PS3='Please enter your choice: '
  options=("ReactFrontend" "MongoDB" "ReactFullstack" "AWS" "Java8" "Java17" \
    "K8S" "Python" "Jetbrains-toolbox" "Git-Setup" "Quit")
  select opt in "${options[@]}"
  do
    #$REPLY holds number pkgs if needed
      case $opt in
          "ReactFrontend")
              #echo "Setup projects for React"
              local pkgs=("Common" "Node" "React")
              echo ${pkgs[@]}
              break
              ;;
          "MongoDB")
              #echo "Setup projects for NodeJs & Mongo"
              local pkgs=("Common" "Node" "MongoDb" "MongoShell")
              echo ${pkgs[@]}
              break
              ;;
          "ReactFullstack")
              #echo "Setup projects for React with Node & Mongo"
              local pkgs=("Common" "Node" "React" "MongoDb" "MongoShell")
              echo ${pkgs[@]}
              break
              ;;
          "AWS")
              #echo "Setup projects for Kubernetes & Helm"
              local pkgs=("Common" "AWS")
              echo ${pkgs[@]}
              break
              ;;
          "K8S")
              #echo "Setup projects for Kubernetes & Helm"
              local pkgs=("Common" "Kubectl" "Helm" "Kompose")
              echo ${pkgs[@]}
              break
              ;;
          "Java8")
              #echo "Setup projects for Java & Maven"
              local pkgs=("Common" "Jenv" "Java8" "Mvn")
              echo ${pkgs[@]}
              break
              ;;
          "Java17")
              #echo "Setup projects for Java17 & gradle"
              local pkgs=("Common" "Jenv" "Java17" "Gradle")
              echo ${pkgs[@]}
              break
              ;;
          "Python")
              #echo "Setup projects for python 3.6.15"
              local pkgs=("Common" "PyenvDeps" "Pyenv" "Python36")
              echo ${pkgs[@]}
              break
              ;;
          "Jetbrains-toolbox")
              #echo "Setup projects for python 3.6.15"
              local pkgs=("Common" "Jetbrains")
              echo ${pkgs[@]}
              break
              ;;
          "Git-Setup")
              #echo "Configure Git Settings"
              local pkgs=("Common" "Gpg")
              echo ${pkgs[@]}
              break
              ;;
          "Quit")
              break
              ;;
          *) echo "invalid option $REPLY";;
      esac
  done
}

PWD="$(pwd)"
# get projectChoise first
PKGS=( $(projectChoise) )

if [[ ${#PKGS[*]} == 0 ]]; then
  exit
fi

#echo "install packages: ${PKGS[@]}"

for ix in ${!PKGS[*]}
do
  pkg=${PKGS[$ix]}
  echo
  printf "=========> Installing:  %s\n" "$pkg <========="
  add$pkg # pkg name in adders.sh should match pattern add+$pkg (e.g. addCommon)
  echo
done

echo

