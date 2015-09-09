#!bin/bash
sudo yum -y install vim memcached git zsh curl gcc make tmux
sudo yum -y install php5 libapache2-mod-php5 php5-mcrypt
sudo yum -y install php5-mysql pdo-mysql php5-cli

#install nodejs
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo yum -y install nodejs

#install oh-my-zsh
#curl -L http://install.ohmyz.sh | sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#make projects dir for our work
mkdir -p ~/projects

#mount vbox host shared dir
#mkdir -p ~/host
#sudo mount -t vboxsf WinDocuments ~/host

#generate ssh keys
#ssh-keygen -t rsa -C "myUser@myCompany.com"

#setup ssh keys from existing
#cp -r ssh ~/

#setup bashrc from existing
cp ~/.bashrc ~/.bashrc-backup
cp .backup ~/

#setup vimrc from existing
cp ~/.vimrc ~/.vimrc-backup
cp .vimrc ~/

#setup zsh from existing
cp ~/.zshrc ~/.zshrc-backup
cp .zshrc ~/

#setup gitconfig from existing
cp .gitconfig ~/

#install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#install Bundle 'Syntastic'
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git

#install Bundle 'NerdTree'
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git


#install docker
sudo yum -y update
sudo yum -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

#run docker without sudo
#sudo groupadd docker
sudo gpasswd -a aperez docker
sudo service docker.io restart

