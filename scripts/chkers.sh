#!/usr/bin/env bash

function chkNet31(){
  [[ `command -v dotnet` ]] && echo true || echo false
}
function chkCurl(){
  [[ `command -v curl` ]] && echo true || echo false
}
function chkGit(){
  [[ `command -v git` ]] && echo true || echo false
}
function chkFile(){
  [[ `command -v file` ]] && echo true || echo false
}
function chkVim(){
  [[ `command -v vim` ]] && echo true || echo false
}
function chkZsh(){
  [[ `command -v zsh` ]] && echo true || echo false
}
function chkBrew(){
  [[ `command -v brew` ]] && echo true || echo false
}
function chkJq(){
  [[ `command -v jq` ]] && echo true || echo false
}
function chkNvm(){
  source $(brew --prefix nvm)/nvm.sh
  [[ `command -v nvm` ]] && echo true || echo false
}
function chkNpm(){
  source $(brew --prefix nvm)/nvm.sh
  [[ `command -v npm` ]] && echo true || echo false
}
function chkMongo(){
  source $(brew --prefix nvm)/nvm.sh
  [[ `command -v npm` ]] && echo true || echo false
}
function chkNode(){
  source $(brew --prefix nvm)/nvm.sh
  [[ `command -v node` ]] && echo true || echo false
}
function chkReact(){
  source $(brew --prefix nvm)/nvm.sh
  REACT=$(npm list -g --depth 0 create-react-app | grep react | cut -d '-' -f2)
  [[ $REACT != "react" ]] && echo true || echo false
}
function chkAwsCli(){
  source $(brew --prefix nvm)/nvm.sh
  SDK=$(npm ls -g --depth 0 | grep aws-sdk | cut -d ' ' -f2 | cut -d '@' -f1)
  [[ $SDK != "aws-sdk" ]] && echo true || echo false
}
function chkAwsSam(){
  [[ `command -v sam` ]] && echo true || echo false
}
function chkAwsIam(){
  [[ `command -v aws-iam-authenticator` ]] && echo true || echo false
}
function chkShUnit(){
  [[ `command -v shunit2` ]] && echo true || echo false
}
function chkHelm(){
  [[ `command -v helm` ]] && echo true || echo false
}
function chkKubectl(){
  [[ `command -v kubectl` ]] && echo true || echo false
}
function chkMvn(){
  [[ `command -v mvn` ]] && echo true || echo false
}
function chkKubeConfig(){
  [[ `echo $KUBECONFIG` ]] && echo $KUBECONFIG || echo false
}
function chkBashProfile(){
  [[ -f ~/.bash_profile ]] && echo true ||  echo false
}
function chkBashrc(){
  [[ -f ~/.bashrc ]] && echo true ||  echo false
}
function chkKube(){
  [[ -f ~/.kube ]] && echo true ||  echo false
}
function chkGitFileCurl(){
  if [[ $(chkGit) || $(chkFile) || $(chkCurl) ]]; then
    echo true
  else
    echo false
  fi
}
function chkZshShell(){
  [[ "$(echo $0)" == "-zsh" ]] && echo true || echo false
}
