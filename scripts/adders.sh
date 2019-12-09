#!/usr/bin/env bash

source ./scripts/chkers.sh
source ./scripts/util.sh

function addBrew(){
  if [[ $(chkBrew) = true ]]; then
    #already installed
    brew update && brew cleanup
    return
  elif [[ $(getOS) == "Mac" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif [[ $(getOS) == "Lin" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  else
    echo "Sorry can't install homebrew"
    exit 1
  fi
}
function addNvm(){
  if [[ $(chkNvm) = true ]]; then
    #already installed
    brew upgrade nvm
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addNvm
  else
    [[ `brew ls --versions nvm` ]] && return || brew install nvm
  fi
}
function addNode(){
  addNvm
  source /usr/local/opt/nvm/nvm.sh
  VER=$(nvm version)
  if [[ $VER != "v12.9.0" ]]; then
    nvm install 12.9.0 && nvm use 12.9.0
    echo "you can add other versions with 'nvm install x.x.x && nvm use x.x.x'"
  fi
  echo "USING NodeJs $VER"
}
function addJq(){
  if [[ $(checkJq) = true ]]; then
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
  echo "=========> install ohMyZsh"
  #if [ ${unameOut} == "Darwin" ]; then
  # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  #fi
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
  echo
  addVim
  echo "Using Pathogen to manage your plugins"
  echo "=========> install pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  echo "Now you can install any plugin into a .vim/bundle/plugin-name/ folder"
  echo
  echo "=========> install Bundle 'Syntastic'"
  cd ~/.vim/bundle && \
  git clone https://github.com/scrooloose/syntastic.git
  echo
  echo "=========> install Bundle 'NerdTree'"
  cd ~/.vim/bundle && \
  git clone https://github.com/scrooloose/nerdtree.git
  echo
  echo "=========> install Bundle 'NerdTree-tabs'"
  cd ~/.vim/bundle && \
  git clone https://github.com/jistr/vim-nerdtree-tabs.git
  echo
  echo "=========> install Bundle 'DelimitMate'"
  cd ~/.vim/bundle && \
  git clone https://github.com/Raimondi/delimitMate.git
  echo
  echo "=========> install Bundle 'vim-prettier'"
  cd ~/.vim/bundle && \
  git clone https://github.com/prettier/vim-prettier.git
}
function addBashrcToProfile(){
  if [[ ! -f ~/.bashrc ]]; then
    echo 'if [ -r ~/.bashrc ]; then' >> ~/.bash_profile
    echo '  source ~/.bashrc' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
    echo ' ' >> ~/.bash_profile
  fi
}
function addGit(){
  if [[ $(chkGit) = true ]]; then
    #already installed
    brew upgrade git
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addGit
  else
    [[ `brew ls --versions git` ]] && return || brew install git
  fi
}
function addCurl(){
  if [[ $(chkCurl) = true ]]; then
    #already installed
    brew upgrade curl
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
    addBrew
    addCurl
  else
    [[ `brew ls --versions curl` ]] && return || brew install curl
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
function addCommon(){
  addBashrcToProfile
  addProjectsDir
  addGit
  addCurl
  addZsh
  addJq
  addVim
  addVimPlugins
}
