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
#function chkPrereq(){
#  addVault
#  addAwsCli
#  addAwsIam
#  addJq
#  addHelm
#  addKubectl
#}
function projectChoise(){
  PS3='Please enter your choice: '
  options=("ReactFrontend" "MongoDB" "ReactFullstack" "AWS" "Java8" "K8S" "DotNet3.1" "Quit")
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
              local pkgs=("Common" "Kubectl" "Helm")
              echo ${pkgs[@]}
              break
              ;;
          "Java8")
              #echo "Setup projects for Java & Maven"
              local pkgs=("Common" "Java8" "Mvn")
              echo ${pkgs[@]}
              break
              ;;
          "DotNet3.1")
              #echo "Setup projects for dotNet 3.1"
              local pkgs=("Common" "DotNet31")
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
