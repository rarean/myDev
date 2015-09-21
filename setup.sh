#!/bin/bash
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
curl -L https://www.npmjs.com/install.sh | sudo sh
sudo npm install -g npm@3.0-latest

echo "=========> installing Docker"
sudo yum -y install docker-io
sudo groupadd docker
sudo gpasswd -a aperez docker
sudo service docker start

echo "=========> installing Maven 3.3.3"
wget --no-cookies http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -O - >> /tmp/apache-maven-3.3.3-bin.tar.gz
tar xzvf /tmp/apache-maven-3.3.3-bin.tar.gz
sudo mv apache-maven-3.3.3 /opt

echo "=========> installing Java 1.8"
wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm
sudo rpm -iUvh jdk-8u60-linux-x64.rpm


