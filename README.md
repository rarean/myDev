# CentOS 6.5 Dev Box setup

* run setup.sh to install vim bundles, copy config files, install java &
docker, etc

* generate ssh keys with ssh-keygen -t rsa -C "johndoe@example.com"

* ensure maven settings are correct in /opt/apache-maven-3.3.3/conf/settings.xml

## finish git setup

* update username

			git config --global user.name "John Doe"
			git config --global user.email johndoe@example.com

## finish docker setup
* Add yourself into the docker group

			sudo groupadd docker
			sudo gpasswd -a johndoe docker

* Add following line to Docker configuration file

			vi /etc/sysconfig/docker
			other_args=" -H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock"

## Start/Restart docker
* sudo service docker restart

## Test docker
* docker --version
* docker version

# Notes

* start working
