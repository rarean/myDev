# CentOS 6.5 Dev Box setup

* run setup.sh to install nodejs, java, maven & docker
* run configure.sh to install vim bundles & copy config files

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
			sudo usermod -aG docker your_username

* Add following line to Docker configuration file

			vi /etc/sysconfig/docker
			other_args=" -H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock"

* Start/Restart docker

			sudo service docker restart

	logout and log back in again to run docker without sudo and get config
	changes

## Test install
* docker version
* java -version
* mvn -v
* node -v

# Notes

* start working
