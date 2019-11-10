#!/bin/bash

echo "=========> make projects dir for our work"
mkdir -p ~/projects

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

