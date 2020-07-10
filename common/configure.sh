#!/bin/bash

unameOut="$(uname -s)"
echo "=========> make projects dir for our work"
mkdir -p ~/projects
echo
echo "=========> install vim plugins <========="
echo
echo "=========> install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
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
if [ ! -f ~/.bash_profile && ${unameOut} == "Darwin" ]; then
echo "=========> add bash_profile if not exist to macOsX"
  touch ~/.bash_profile
  echo 'if [ -r ~/.bashrc ]; then' >> ~/.bash_profile
  echo '  source ~/.bashrc' >> ~/.bash_profile
  echo 'fi' >> ~/.bash_profile
fi

