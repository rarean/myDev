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
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#install Bundle 'Syntastic'
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git

#install Bundle 'NerdTree'
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git


#install docker
sudo su -c 'rpm -iUvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'
sudo yum -y install epel-release
sudo yum -y update

sudo yum -y install docker-io
#sudo groupadd docker
#sudo gpasswd -a aperez docker
sudo service docker start


# Download and set up Maven 3
wget --no-cookies http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -O - >> /tmp/apache-maven-3.3.3-bin.tar.gz
tar xzvf /tmp/apache-maven-3.3.3-bin.tar.gz
sudo mv apache-maven-3.3.3 /opt

# download and set up Java 8
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm
sudo rpm -ivh jdk-8u60-linux-x64.rpm
