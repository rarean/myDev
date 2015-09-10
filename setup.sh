#!bin/bash
sudo yum -y install vim memcached git zsh curl gcc make tmux
sudo yum -y install php5 libapache2-mod-php5 php5-mcrypt
sudo yum -y install php5-mysql pdo-mysql php5-cli
sudo yum -y groupinstall "Development Tools"

echo "=========> adding epel repo"
sudo su -c 'rpm -iUvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'
sudo yum -y install epel-release
sudo yum -y update

echo "=========> install NodeJs"
curl --silent --location https://rpm.nodesource.com/setup | bash -
sudo yum -y install nodejs

echo "=========> install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "=========> make projects dir for our work"
sudo mkdir -p ~/projects

#mount vbox host shared dir
#mkdir -p ~/host
#sudo mount -t vboxsf WinDocuments ~/host

#generate ssh keys
#ssh-keygen -t rsa -C "myUser@myCompany.com"

#setup ssh keys from existing
#cp -r ssh ~/

echo "=========> install pathogen"
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "=========> install Bundle 'Syntastic'"
cd ~/.vim/bundle
git clone https://github.com/scrooloose/syntastic.git

echo "=========> install Bundle 'NerdTree'"
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git


echo "=========> installing Docker"
cd ~

sudo yum -y install docker-io
#sudo groupadd docker
#sudo gpasswd -a aperez docker
sudo service docker start


echo "=========> installing Maven 3.3.3"
wget --no-cookies http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -O - >> /tmp/apache-maven-3.3.3-bin.tar.gz
tar xzvf /tmp/apache-maven-3.3.3-bin.tar.gz
sudo mv apache-maven-3.3.3 /opt

echo "=========> installing Java 1.8"
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm
sudo rpm -iUvh jdk-8u60-linux-x64.rpm

echo "=========> Set environmental variables"
echo "=========> copy bashrc from existing"
cp ~/.bashrc ~/.bashrc-backup
cp .bashrc ~/

echo "=========> copy vimrc from existing"
cp ~/.vimrc ~/.vimrc-backup
cp .vimrc ~/

echo "=========> copy zshrc from existing"
cp ~/.zshrc ~/.zshrc-backup
cp .zshrc ~/

echo "=========> copy gitconfig from existing"
cp .gitconfig ~/


echo "=========> Set environmental variables for Java and Maven"
echo 'export JAVA_HOME=/opt/jdk1.8.0_60' >> ~/.bashrc
echo 'export M3_HOME=/opt/apache-maven-3.3.3' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin' >> ~/.bashrc
echo 'export JAVA_HOME=/opt/jdk1.8.0_60' >> ~/.zshrc
echo 'export M3_HOME=/opt/apache-maven-3.3.3' >> ~/.zshrc
echo 'export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin' >> ~/.zshrc
