#!/usr/bin/env bash

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
function bashRcConfig(){
  $PWD = ${1}
  if [[ ! -f ~/.bash_profile && $(getOS) == "Mac" ]]; then
  echo "=========> add bash_profile to macOsX"
    touch ~/.bash_profile
    echo 'if [ -r ~/.bashrc ]; then' >> ~/.bash_profile
    echo '  source ~/.bashrc' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
  fi
  if [[ -f ~/.bashrc ]]; then
    echo "backup current settings"
    mv ~/.bashrc ~/.bashrc.bak
  fi
  ln -s $PWD/common/bashrc ~/.bashrc
}
function vimRcCofig(){
  PWD=${1}
  if [[ -f ~/.vimrc ]];then
    echo "backup current vim settings"
    mv ~/.vimrc ~/.vimrc.bak
  fi
  ln -s $PWD/common/vimrc ~/.vimrc
}
function chkPrereq(){
  addVault
  addAwsCli
  addAwsIam
  addJq
  addHelm
  addKubectl
}
function projectChoise(){
  PS3='Please enter your choice: '
  options=("ReactFrontend" "Backend" "ReactFullstack" "AWS" "Java" "Quit")
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
          "Backend")
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
              local pkgs=("Common" "Kubectl" "Helm" "Aws")
              echo ${pkgs[@]}
              break
              ;;
          "Java")
              #echo "Setup projects for Java & Maven"
              local pkgs=("Common" "Java" "Mvn")
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
