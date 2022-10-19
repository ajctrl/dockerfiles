#! /bin/sh

# exit if a command fails
set -eo pipefail

apk update
apk add openssl aws-cli

wget https://ftp.postgresql.org/pub/source/v15.0/postgresql-15.0.tar.gz
tar xzf postgresql-15.0.tar.gz
rm postgresql-15.0.tar.gz
cd postgresql-15.0
apk add make gcc libtool automake autoconf g++ readline-dev zlib-dev linux-headers
./configure --with-pgport=5432 --prefix=/usr/bin/
make
make install
apk delete make gcc libtool automake autoconf g++ readline-dev zlib-dev linux-headers
cd ../
rm -rf postgresql-15.0

# cleanup
rm -rf /var/cache/apk/*
