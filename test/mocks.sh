#!/usr/bin/env bash

# Treat unset variables as an error.
set -u
PROFILE='~/.bash_profile'

function mockMacKernel(){
  echo "Darwin"
}
function mockLinKernel(){
  echo "Linux"
}
function mockWindows(){
  echo "Cygwin"
}
function mockUnix(){
  echo "Unix"
}

function mockHaveVault(){
  echo true
}
function mockHaveAwsCli(){
  echo true
}
function mockHaveJq(){
  echo true
}
function mockHaveAwsIam(){
  echo true
}

