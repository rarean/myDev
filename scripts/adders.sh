#!/usr/bin/env bash
source ./scripts/chkers.sh
source ./scripts/util.sh

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
  elif [[ $(chkPython) = false ]]; then
    echo "you must install Python >= 2.7.x+ to use awscli"
  else
    brew install awscli
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
    addAwsIam
  else
    [[ `brew ls --versions aws-iam-authenticator` ]] && return || brew install aws-iam-authenticator
  fi
}
function addXcodeCli(){
  if [[ $(chkXcode) = true ]]; then
    return
  else
    xcode-select --install
  fi
}
function addJq(){
  if [[ $(chkJq) = false ]]; then
    [[ `brew ls --versions jq` ]] && brew upgrade jq || brew install jq
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
    addHelm
  else
    [[ `brew ls --versions helm` ]] && return || brew install helm
  fi
}
function addKubectl(){
  if [[ $(chkKubectl) = true ]]; then
    #already installed
    brew upgrade kubectl
    echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc
    echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.bashrc
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
  else
    [[ `brew ls --versions kubectl` ]] && return || brew install kubectl
  fi
}
function addZsh(){
  if [[ $(chkZsh) = false ]]; then
    [[ `brew ls --versions zsh` ]] && brew upgrade zsh || brew install zsh
  fi
}
function addOhMyZsh(){
  if [[ ! -d ~/.oh-my-zsh && $(chkZsh) = true ]]; then
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
  if [[ $(chkVim) = false ]]; then
    [[ `brew ls --versions vim` ]] && brew upgrade vim || brew install vim
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
    echo "backup current bash settings"
    mv ~/.bashrc ~/.bashrc.bak
    ln -sf $(pwd)/common/bashrc ~/.bashrc
  fi
}
function addZshrc(){
  if [[ -f ~/.zshrc ]]; then
    echo "backup current zsh settings"
    mv ~/.zshrc ~/.zshrc.bak
  fi
  ln -sf $(pwd)/common/zshrc ~/.zshrc
}
function addMongoDb(){
  if [[ $(chkMongoDb) = true ]]; then
    #already installed
    brew upgrade mongodb-community
    return
  elif [[ $(chkBrew) = false ]]; then
    echo "Sorry requires homebrew first"
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
function addJenv(){
  if [[ $(chkJenv) = true ]]; then
    return
  else
    brew install jenv
    source ~/.zshrc
  fi
}
function addJava8(){
  if [[ $(getOS) == "Mac" && $(chkJenv) = true ]]; then
    brew tap adoptopenjdk/openjdk
    brew cask install adoptopenjdk8
    jenv add $(find `brew --prefix adoptopenjdk8`)
    jenv global 8
    exec $SHELL
  else
    echo "You will need to install Java8 manually"
  fi
}
function addJava17(){
  if [[ $(getOS) == "Mac" && $(chkJenv) = true ]]; then
    brew install openjdk@17
    jenv add $(find `brew --prefix openjdk@17`)
    jenv global 17
    exec $SHELL
  else
    echo "You will need to install Java17 manually"
  fi
}
function addGradle(){
  if [[ $(chkGradle) = false ]]; then
    brew install gradle
  fi
}
function addPyenvDeps(){
  if [[ $(chkBrew) = false ]]; then
    echo "Please install homebrew first"
  else
    brew install bzip2 lbzip2 lzlib openssl zlib readline sqlite3 xz
  fi
}
function addPyenv(){
  if [[ $(chkCurl) = false ]]; then
    echo "Please install curl first"
  else
    curl https://pyenv.run | bash
  fi
}
function addPython36(){
 # workaround for 3.6.15 on macOS 12.0.1
 pyenv update
 LDFLAGS="-L/usr/local/opt/bzip2/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openssl@1.1/lib" CFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I$(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration" pyenv install 3.6.15
}
function addJetbrains(){
  if [[ $(chkJetbrains) = false ]]; then
    brew install jetbrains-toolbox
  fi
}
function addKompose(){
  if [[ $(chkKompose) = false ]]; then
    curl -L https://github.com/kubernetes/kompose/releases/download/v1.25.0/kompose-darwin-amd64 -o /tmp/kompose
    chmod +x /tmp/kompose
    mv /tmp/kompose /usr/local/Cellar/kompose
    ln -sf /usr/local/Cellar/kompose /usr/local/bin/kompose
  fi
}
function addGpg(){
  if [[ $(chkGpg) = false ]]; then
    brew install gpg
  fi
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
  if [[ $(chkBrew) = false ]]; then
    echo "Homebrew is a prerequisite. Please install first"
    exit 1
  fi

  addProjectsDir
  addZsh
  addJq
  addXcodeCli
  addVim
  addVimPlugins
  addBashrcToProfile
  addZshrc
  addOhMyZsh
}
function addAWS(){
  addAwsCli
  addAwsSam
  addAwsIam
}
function addGitSetup(){
  addGpg
  gitConfig # from utils
}

