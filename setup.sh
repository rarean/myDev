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

echo


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

