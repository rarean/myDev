#!/bin/bash

unameOut="$(uname -s | cut -d '_' -f1)"
if [[ ! -d ~/projects ]]; then
  echo "=========> make projects dir for our work"
  mkdir -p ~/projects
fi

echo "=========> install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "=========> install Bundle 'Syntastic'"
cd ~/.vim/bundle && \
git clone https://github.com/scrooloose/syntastic.git

echo "=========> install Bundle 'NerdTree'"
cd ~/.vim/bundle && \
git clone https://github.com/scrooloose/nerdtree.git

echo "=========> install Bundle 'NerdTree-tabs'"
cd ~/.vim/bundle && \
git clone https://github.com/jistr/vim-nerdtree-tabs.git

echo "=========> install Bundle 'DelimitMate'"
cd ~/.vim/bundle && \
git clone https://github.com/Raimondi/delimitMate.git

if [[ ! -f ~/.bash_profile && ${unameOut} == "Darwin" || ${unameOut} == "MINGW64" ]]; then
echo "=========> add bash_profile "
  touch ~/.bash_profile
  echo 'if [ -r ~/.bashrc ]; then' >> ~/.bash_profile
  echo '  source ~/.bashrc' >> ~/.bash_profile
  echo 'fi' >> ~/.bash_profile
fi

if [[ ${unameOut} == "Darwin" ]]; then
echo "=========> install ohMyZsh for macOsX"
 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
