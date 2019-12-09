#!/usr/bin/env bash

source ./scripts/common.sh
source ./scripts/installers.sh

PWD="$(pwd)"
PKGS=( $(projectChoise) )
OS=$(getOS)

#echo "Packages to install: ${#PKGS[*]}"
while [[ $OS != "" ]] #some type of OS
do
  case $OS in
    "Win")
      chocoPkgInstaller $PKGS
      break
      ;;
    "Mac")
      brewPkgInstaller $PKGS
      break
      ;;
    "Lin")
      brewPkgInstaller $PKGS
      break
      ;;
    *) echo "Unknown OS"
       echo "Not able to install packages"
      break
      ;;
  esac
done

#echo "Let's get started"
#echo "Looks like you are on $(getOS)"
#if [[ $(getOS) == "unknown" ]]; then
#  echo "Sorry, your OS is not supported"
#  exit 1
#fi
#echo
#if [[ $(getOS) != "Win" ]]; then
#  echo "Do you want to use oh-my-zsh shell? "
#  if [[ $(confirm) = true ]]; then
#    addOhMyZsh
#  fi
#  if [[ $(chkZshShell) =  true ]]; then
#    cd $PWD
#  fi
#fi
#echo ""
#echo "Add $HOME/projects dir for your work?"
#if [[ $(confirm) = true ]];then
#  addProjectsDir
#fi
#echo ""
#echo "Install common Vim plugins?"
#if [[ $(confirm) = true ]]; then
#  addVimPlugins
#fi
#cd $PWD
#echo ""
#
#echo "Use vimrc settings from this repo?"
#if [[ $(confirm) = true ]]; then
#  vimRcConfig $PWD
#fi
#echo
#echo "Use bashrc settings from this repo?"
#if [[ $(confirm) = true ]]; then
#  bashRcConfig $PWD
#fi
#echo
## add packages
#if [[ $(getOS) != "Win" && $(chkBrew) = false ]]; then
#  echo " chould not find Hombrew/LinuxBrew"
#  echo " do you want to install brew?"
#  if [[ $(confirm) = true ]]; then
#    addBrew
#  else
#    echo "Homebrew required to use this auto-setup"
#    echo "Please use your package manager to setup your system"
#    exit 0
#  fi
#fi
#echo
#if [[ $(getOS) != "Win" && $(chkBrew) = true && $(chkNpm) = false ]]; then
#  echo " chould not find NodeJs/NPM"
#  echo " do you want to install them?"
#  if [[ $(confirm) = true ]]; then
#      echo "installing node version manager first"
#      addNvm
#      echo "using nodejs v12.9"
#      nvm install 12.9.0 && nvm use 12.9.0
#      echo "you can add other versions with 'nvm install x.x.x && nvm use x.x.x'"
#  else
#    echo " you will need to install the following seperatly for your OS"
#    echo " * nodejs"
#    echo " * npm"
#  fi
#fi
#

#if [ ${unameOut} == "CYGWIN" ]; then
#  VBOX="/cygdrive/c/Program Files/Oracle/VirtualBox"
#fi
#if [ ${unameOut} == "Darwin" ]; then
#  export JAVA_HOME=$(/usr/libexec/java_home)
#  export M3_HOME=/Applications/apache-maven-3.6.0
#  export M2_HOME=/Applications/apache-maven-3.6.0
#  export MVN_HOME=/Applications/apache-maven-3.6.0
#elif [ ${unameOut} == "CYGWIN" ]; then
#  export JAVA_HOME=/cygdrive/c/Program\ Files/Java/jdk1.8.0_92
#  export M3_HOME=/opt/apache-maven-3.6.0
#  export M2_HOME=/opt/apache-maven-3.6.0
#fi

#export PATH=$PATH:$JAVA_HOME/bin:$MVN_HOME/bin:$LOGSTASH_HOME/bin
#export PATH=$PATH:$M3_HOME/bin:$M2_HOME/bin

