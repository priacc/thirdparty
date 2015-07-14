#!/bin/bash

set -e

UP=`pwd`

TAR="tar xvzf"

# install ubuntu packages
./install_pepper_deps_ubuntu.sh

# papi
echo "installing PAPI"
$TAR papi-5.1.1.tar.gz
cd papi-5.1.1/src
./configure 
make
sudo make install
cd $UP
rm -rf papi-5.1.1

# chacha
echo "installing chacha"
$TAR chacha-fast.tar.gz
cd chacha-fast
make 
sudo make install
cd $UP
rm -rf chacha-fast

# NTL
echo "installing NTL"
$TAR ntl-5.5.2.tar.gz
cd ntl-5.5.2/src
./configure NTL_GMP_LIP=on
make
sudo make install
cd $UP 
rm -rf ntl-5.5.2

# libconfig 
echo "installing libconfig"
$TAR libconfig-1.4.8.tar.gz
cd libconfig-1.4.8
./configure 
make
sudo make install
sudo ldconfig
cd $UP
rm -rf libconfig-1.4.8

# Cheetah template library
echo "installing Cheetah template library"
$TAR Cheetah-2.4.4.tar.gz
cd Cheetah-2.4.4
sudo python setup.py install
cd $UP
sudo rm -rf Cheetah-2.4.4

# GMPMEE
echo "installing gmpmee"
$TAR gmpmee-0.1.5.tar.gz
cd gmpmee-0.1.5
./configure 
make
sudo make install
cd $UP
rm -rf gmpmee-0.1.5

# fcgi
echo "installing fcgi"
$TAR fcgi-2.4.0.tar.gz
cd fcgi-2.4.0
./configure 
make
sudo make install
cd $UP
rm -rf fcgi-2.4.0

# pbc
echo "installing pbc"
$TAR pbc-0.5.13.tar.gz
cd pbc-0.5.13
./configure LDFLAGS="-lgmp"
make
sudo make install
cd $UP
rm -rf pbc-0.5.13

#leveldb
echo "installing leveldb"
$TAR leveldb-1.10.0.tar.gz
cd leveldb-1.10.0
make
sudo mkdir -p /usr/local/include/leveldb
sudo cp include/leveldb/* /usr/local/include/leveldb/
sudo cp -d libleveldb.* /usr/local/lib/
#cp --preserve=links libleveldb.* $DEPS_DIR/lib
#cp -r include/leveldb $DEPS_DIR/include
cd $UP
rm -rf leveldb-1.10.0

#xbyak
echo "installing xbyak"
$TAR xbyak-20130621.tar.gz
cd xbyak
make
sudo make install
cd $UP
rm -rf xbyak

#ate-pairing
echo "installing ate-pairing"
$TAR ate-pairing-20130611.tar.gz
cd ate-pairing
make
sudo mkdir -p /usr/local/lib/libzm
sudo cp -r lib/libzm.a /usr/local/lib/libzm
sudo mkdir -p /usr/local/include/libzm
sudo cp -r include/* /usr/local/include/libzm/
#mkdir -p $DEPS_DIR/lib/libzm
#cp lib/libzm.a $DEPS_DIR/lib/libzm
#mkdir -p $DEPS_DIR/include/libzm
#cp include/* $DEPS_DIR/include/libzm
cd $UP
rm -rf ate-pairing

#mysql
wget http://ftp.kaist.ac.kr/mysql/Downloads/MySQL-5.6/mysql-5.6.25-linux-glibc2.5-x86_64.tar.gz
$TAR mysql-5.6.25-linux-glibc2.5-x86_64.tar.gz
sudo mv mysql-5.6.25-linux-glibc2.5-x86_64 /usr/local
cd /usr/local
sudo ln -s mysql-5.6.25-linux-glibc2.5-x86_64 mysql
