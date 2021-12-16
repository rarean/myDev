# Setup local box with common Dev tools
PREREQUISITES
hombrew & curl

# TL;DR
Install Homebrew
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Install Git
`brew install git`

Clone this repo
`git clone ${RepoURL}`

Install tools for your project
`cd devSetup && ./setup.sh`


## MacOS
Uses [Homebrew](https://brew.sh/) to setup Mac & Install

run `./setup.sh` to install packages
```bash
$ ./setup.sh
1) ReactFrontend        5) Java8	       9) Jetbrains-toolbox
2) MongoDB	        6) Java17	      10) Quit
3) ReactFullstack       7) K8S
4) AWS		        8) Python
```

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

