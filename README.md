# Setup local box with common Dev tools

## Only Setup Bash
Use this option for cygwin (windows) and Mac (OSX). Packages like NodeJs, Java,
    ect. will need to be installed seperately.

* symlink `cygwin/bashrc` to `~/.bashrc`
* execute/run `cygwin/configure.sh` to setup pathogen and plugins
* symlink `cygwin/vimrc` to `~/.vimrc`

Some things like generating ssh keys and git setup below may work with cygwin
or OSX, but other tutorials on how to do that exist elseware.

# Ubuntu Setup

* run setup_deb.sh to install base packages

# CentOS Setup

* run setup_rhel.sh to install nodejs, java, maven & docker

# Configure
* run configure.sh to install vim bundles & copy config files


### Finish git setup

* generate ssh keys with ssh-keygen -t rsa -C "johndoe@example.com"
* ensure maven settings are correct in /opt/apache-maven-3.3.3/conf/settings.xml
* update username

			git config --global user.name "Your Name"
			git config --global user.email your.email@example.com

### Finish docker setup
* Add yourself into the docker group

			sudo gpasswd -a johndoe docker
			sudo usermod -aG docker your_username

* Add following line to Docker configuration file

			vi /etc/sysconfig/docker
			other_args=" -H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock"

* Start/Restart docker

			sudo service docker restart

	logout and log back in again to run docker without sudo and get config
	changes

### Test install
* docker version
* java -version
* mvn -v
* node -v
* npm -v

# Notes

* start working
* your mileage may vary for setup items
