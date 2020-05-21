#!/bin/bash

# Add LLVM apt source
sudo apt-get install -y software-properties-common
sudo apt-add-repository 'deb http://apt.llvm.org/buster/ llvm-toolchain-buster-8 main'
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt-get update


dylan_requirements="autoconf automake clang-8 gcc libgc-dev libunwind-dev"

packages="emacs git apt-file binutils gdb linux-perf net-tools"

sudo apt-get install -y ${packages} ${dylan_requirements}

# For building Sphinx documentation
sudo easy_install python-dateutil==1.5
sudo easy_install html5lib

# Setup Docker -- https://docs.docker.com/install/linux/docker-ce/debian/
# sudo apt-get remove docker docker-engine docker.io containerd runc
# sudo apt update
# sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg2     software-properties-common
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# lsb_release -cs
# sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# sudo apt update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
# sudo docker run hello-world
# sudo docker run -it ubuntu bash
# sudo usermod -aG docker cgay   # make docker user-accessible (requires re-login)
# sudo systemctl enable docker   # run dockerd at startup

# emacs:
# * M-x package-refresh
# * M-x package-install deadgrep
