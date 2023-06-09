#!/bin/bash
./configure --prefix=/usr \
	--enable-cxx      \
	--disable-static  \
	--docdir=/usr/share/doc/gmp-6.2.1

make
make html
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
make DESTDIR=$1 install
make DESTDIR=$1 install-html
