#!/bin/bash

git clone https://github.com/keystone-engine/keystone.git ;cd keystone
mkdir build
cd build
../make-share.sh
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -G "Unix Makefiles" ..
make -j10
make install
make install
make install
echo "include /usr/local/lib" >> /etc/ld.so.conf
ldconfig
cd ../bindings/python
python3 setup.py install
cd /
rm -r keystone


# install capstone
git clone https://github.com/aquynh/capstone.git; cd capstone
./make.sh
./make.sh install
cd bindings/python
python3 setup.py install

cd /
rm -r capstone


#install angr
pip3 install angr
