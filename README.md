# Setup local box with common Dev tools

# TL;DR
PREREQUISITES
curl & git

## Mac || Linux (Ubuntu/CentOS) Setup
Uses [Homebrew](https://brew.sh/) to setup Mac & Linux systems

run `./setup.sh` to install packages
```bash
$ ./setup.sh
1) ReactFrontend   3) ReactFullstack  5) Java8           7) Quit
2) MongoDB         4) AWS             6) K8S
Please enter your choice:
```
## Windows
It's recommended to use [Chocolatey](https://chocolatey.org/) to install
packages. Some attemp to do this is included but not documented


# Bash Only Setup
Use this option for cygwin or gitBash (windows) and others where you want more control and just care about bash terminal.
Packages like NodeJs, Java, etc. will need to be installed seperately
Checkout: [Chocolatey](https://chocolatey.org/install) (windows) or [Homebrew](https://brew.sh/) (Mac/Linux)

* symlink `cygwin/bashrc` to `~/.bashrc`
** Example: `ln -s ~/projects/myDev/cygwin/bashrc ~/.bashrc`
* symlink `cygwin/vimrc` to `~/.vimrc`
** Example: `ln -s ~/projects/myDev/cygwin/vimrc ~/.vimrc`

Some things like generating ssh keys and git setup below may work with cygwin
or OSX, but other tutorials on how to do that better exist elseware.


# Finish setup
## Git
* generate ssh keys with `ssh-keygen -t rsa -C "your.email@example.com"`
* update global settings

```bash
git config --global user.name "Your Name"
git config --global user.email your.email@example.com
git config --global core.editor vim
git config --global push.default simple

```

