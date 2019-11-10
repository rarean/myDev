#!/bin/bash

echo "=========> install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "=========> make projects dir for our work"
mkdir -p ~/projects

echo "=========> install pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#mount vbox host shared dir
#mkdir -p ~/host
#sudo mount -t vboxsf WinDocuments ~/host

#generate ssh keys
#ssh-keygen -t rsa -C "myUser@myCompany.com"

#setup ssh keys from existing
#cp -r ssh ~/

echo "=========> copy bashrc from existing"
mv ~/.bashrc ~/.bashrc-backup > /dev/null 2>&1
cp -f bashrc ~/.bashrc

echo "=========> copy vimrc from existing"
mv ~/.vimrc ~/.vimrc-backup > /dev/null 2>&1 
cp -f vimrc ~/.vimrc

echo "=========> copy zshrc from existing"
mv ~/.zshrc ~/.zshrc-backup > /dev/null 2>&1
cp -f zshrc ~/.zshrc

echo "=========> copy gitconfig from existing"
cp -f gitconfig ~/.gitconfig

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


#echo "=========> Set environmental variables for Java and Maven"
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_60' >> ~/.bashrc
echo 'export M3_HOME=/opt/apache-maven-3.3.3' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_60' >> ~/.zshrc
echo 'export M3_HOME=/opt/apache-maven-3.3.3' >> ~/.zshrc
echo 'export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin' >> ~/.zshrc
