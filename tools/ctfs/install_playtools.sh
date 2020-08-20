#!/bin/bash

# install seccomp-tools
gem install seccomp-tools

git clone https://github.com/wapiflapi/villoc.git /tools/villoc
# TODO: Incompatible unicorn issues
 git clone https://github.com/pwndbg/pwndbg.git /tools/pwndbg
#cd /tools/pwndbg ; ./setup.sh

