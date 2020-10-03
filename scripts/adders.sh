#!/usr/bin/env bash
source ./scripts/chkers.sh
source ./scripts/util.sh

function addBrew(){
  if [[ $(chkBrew) = true ]]; then
    #already installed
    brew update && brew cleanup
    return
  elif [[ $(getOS) != "Win" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    echo "Sorry can't install homebrew"
    exit 1
  fi
}
function addNvm(){
  if [[ $(chkNvm) = true ]]; then
    #already installed
    brew upgrade nvm
    if [[ ! -d ~/.nvm ]]; then
      mkdir ~/.nvm
    fi
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addNvm
  else
    [[ `brew ls --versions nvm` ]] && return || brew install nvm
  fi
  if [[ ! -d ~/.nvm ]]; then
    mkdir ~/.nvm
  fi
}
function addNode(){
  addNvm
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  VER=$(nvm version)
  if [[ $VER != "v10.15.3" ]]; then
    nvm install 10.15.3 && nvm use 10.15.3
    echo "you can add other versions with 'nvm install x.x.x && nvm use x.x.x'"
  fi
}
function addAwsCli(){
  if [[ $(chkAwsCli) = true ]]; then
    #already installed
    return
  elif [[ $(chkNpm) = false ]]; then
    addNode
  else
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
    npm install -g aws-sdk
  fi
}
function addAwsSam(){
  if [[ $(chkAwsSam) = true ]]; then
    #already installed
    brew tap aws/tap
    brew upgrade aws-sam-cli
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addAwsSam
  else
    brew tap aws/tap
    [[ `brew ls --versions aws-sam-cli` ]] && return || brew install aws-sam-cli
  fi
}
function addAwsIam(){
  if [[ $(chkAwsIam) = true ]]; then
    #already installed
    brew upgrade aws-iam-authenticator
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addAwsIam
  else
    [[ `brew ls --versions aws-iam-authenticator` ]] && return || brew install aws-iam-authenticator
  fi
}
function addJq(){
  if [[ $(chkJq) = true ]]; then
    #already installed
    brew upgrade jq
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addJq
  else
    [[ `brew ls --versions jq` ]] && return || brew install jq
  fi
}
function addMvn(){
  if [[ $(chkMvn) = true ]]; then
    #already installed
    brew upgrade maven
    return
  else
    [[ `brew ls --versions maven` ]] && return || brew install maven
  fi
}
function addShUnit(){
  if [[ $(chkShUnit) = true ]]; then
    #already installed
    brew upgrade shuit2
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addShUnit
  else
    [[ `brew ls --versions shunit2` ]] && return || brew install shunit2
  fi
}
function addHelm(){
  if [[ $(chkHelm) = true ]]; then
    #already installed
    brew upgrade helm
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addHelm
  else
    [[ `brew ls --versions helm` ]] && return || brew install helm
  fi
}
function addKubectl(){
  if [[ $(chkKubectl) = true ]]; then
    #already installed
    brew upgrade kubectl
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addKubectl
  else
    [[ `brew ls --versions kubectl` ]] && return || brew install kubectl
  fi
}
function addOhMyZsh(){
  if [[ $(getOS) != "Win" && ! -d ~/.oh-my-zsh ]]; then
   echo "=========> install ohMyZsh"
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}
function addProjectsDir(){
  if [[ ! -d ~/projects ]]; then
    mkdir -p ~/projects
  fi
}
function addVim(){
  if [[ $(chkVim) = true ]]; then
    #already installed
    brew upgrade vim
    return
  elif [[ $(chkBrew) = false && $(chkVim) = false ]]; then
    echo "Caution: Vim not installed!"
    echo "You will need to install Vim seperately"
    return
  else
    [[ `brew ls --versions vim` ]] && return || brew install vim
  fi
}
function addVimPlugins(){
  #use https://github.com/junegunn/vim-plug
  if [[ -f ~/.vimrc ]];then
    echo "backup current vim settings"
    mv ~/.vimrc ~/.vimrc.bak
  fi
  ln -sf $(pwd)/common/vimrc ~/.vimrc

  if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  #Install plugins
  vim +PlugInstall +qall
}
function addBashrcToProfile(){
  if [[ ! -f ~/.bashrc && $(getOS) == "Mac" ]]; then
    touch ~/.bashrc
    echo 'if [ -r ~/.bashrc ]; then' >> ~/.bash_profile
    echo '  source ~/.bashrc' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
    echo ' ' >> ~/.bash_profile
  fi
  if [[ -f ~/.bashrc ]]; then
    echo "backup current settings"
    mv ~/.bashrc ~/.bashrc.bak
    ln -sf $(pwd)/common/bashrc ~/.bashrc
  fi
}
function addZsh(){
  if [[ $(chkZsh) = true ]]; then
    #already installed
    brew upgrade zsh
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addZsh
  else
    [[ `brew ls --versions zsh` ]] && return || brew install zsh
  fi
}
function addMongoDb(){
  if [[ $(chkMongoDb) = true ]]; then
    #already installed
    brew upgrade mongodb-community
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addMongoDb
  else
    if [[ `brew ls --versions mongodb-community` ]]; then
      return
    else
      brew tap mongodb/brew
      brew install mongodb-community
    fi
  fi
}
function addMongoShell(){
  if [[ $(chkMongoShell) = true ]]; then
    #already installed
    brew upgrade mongodb-community-shell
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addMongoShell
  else
    if [[ `brew ls --versions mongodb-community` ]]; then
      return
    else
      brew tap mongodb/brew
      brew install mongodb-community-shell
    fi
  fi
}
function addReact(){
  if [[ $(chkReact) = true ]]; then
    #already installed
    npm update -g create-react-app
    return
  else
    npm install -g create-react-app
  fi
}
function addZshrc(){
  if [[ -f ~/.zshrc ]]; then
    echo "backup current settings"
    mv ~/.zshrc ~/.zshrc.bak
  fi
  ln -sf $(pwd)/common/zshrc ~/.zshrc
}
function addCommon(){
  if [[ $(chkGit) = false ]]; then
    echo "git is a prerequisite. Please install first"
    exit 1
  fi
  if [[ $(chkCurl) = false ]]; then
    echo "curl is a prerequisite. Please install first"
    exit 1
  fi

  addBashrcToProfile
  addProjectsDir
  addZsh
  addOhMyZsh
  addJq
  addVim
  addVimPlugins
  addZshrc
}
function addAWS(){
  addNode
  addAwsCli
  addAwsSam
  addAwsIam
}
function addJava8(){
  if [[ $(getOS) == "Mac" ]]; then
    brew tap adoptopenjdk/openjdk
    brew cask install adoptopenjdk8
  elif [[ $(getOS) == "Lin" ]]; then
    echo "You will need sudo access for this: "
    if [[ $(getDistro) == "Deb" ]]; then
      sudo apt-get -y install openjdk-8-jdk
      sudo apt-get -y install openjdk-8-jre
    elif [[ $(getDistro) == "RHEL" ]]; then
      su -c "yum -y install java-1.8.0-openjdk-devel"
      su -c "yum -y install java-1.8.0-openjdk"
    else
      echo "Your distro is not supported with this method"
      echo "You will need to install java8 manually"
    fi
  else
    echo "You will need to install Java8 manually"
  fi
}
