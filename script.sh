#!/bin/bash
# -----------------------------------------------------------------------------
#
# Package    	    : Annoy
# Version    	    : be83fba
# Source repo 	  : https://github.com/spotify/annoy.git
# Tested on     	: 
# Language        : python, C++, lua, go 
# Travis-Check    : false
# Script License  : Apache License 2.0
# Maintainer      : Anurag Chitrakar <anurag_chitrakar.com>
# Disclaimer      : Python module (written in C++) for high-dimensional approximate nearest neighbors (ANN) queries
#
# ----------------------------------------------------------------------------

# installing the required dependencies and files
apt-get -y update
apt-get -y install git
echo "============git installed================="
git --version
apt update
apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
cd /tmp
wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
tar -xf Python-3.7.5.tgz
cd Python-3.7.5
./configure --enable-optimizations
make altinstall
make install
python3 --version
echo "============Python installed================="
cd ..
cd ..
apt-get -y install pip
echo "====================== pip installed================="
pip install --user annoy
pip install numpy
pip3 install cython
echo "====================== numpy installed================="
apt-get install -y pkg-config
apt-get -y install libhdf5-dev
pip install h5py
pip install hererocks
echo "====================== hererocks installed================="

#apt-get -y install libreadline-dev
apt-get -y install curl
hererocks here --lua 5.1 --luarocks 2.2
export PATH="$(pwd)/here/bin/:$PATH"
apt-get install zip unzip
apt-get -y install luarocks
luarocks install busted
luarocks build mpack

pip install swig
echo "======================swig installed================="
pip install tox
echo "======================tox installed================="
cd tmp/
# Cloning Repo
git clone -q https://github.com/spotify/annoy.git C:\projects\annoy
cd C:projectsannoy/

# Build and test package
echo "============build started================="
luarocks make
echo "============build setup.py started================="
python3 setup.py build
python3 setup.py nosetests
busted test/annoy_test.lua
