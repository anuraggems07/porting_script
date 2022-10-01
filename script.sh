#!/bin/bash
sudo docker run -it ubuntu
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
echo "====================== numpy installed================="
apt-get install -y pkg-config
apt-get -y install libhdf5-dev
pip install h5py
pip install hererocks
echo "====================== hererocks installed================="
apt-get -y install libreadline-dev
apt-get install curl wget
hererocks here --lua 5.1 --luarocks 2.2

export PATH="$(pwd)/here/bin/:$PATH"

apt-get install zip unzip
apt-get -y install luarocks
luarocks build mpack
luarocks install busted
luarocks build mpack

pip install swig

echo "======================swig installed================="
pip install tox
echo "======================tox installed================="
cd tmp/
git clone -q https://github.com/spotify/annoy.git C:\projects\annoy
cd C:projectsannoy/
echo "============building started================="

luarocks make
echo "============build of setup.py started================="
python3 setup.py build
python3 setup.py nosetests

busted test/annoy_test.lua
