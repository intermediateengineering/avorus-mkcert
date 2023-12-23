#!/bin/sh

mkcert $API_HOSTNAME 127.0.0.1 localhost
cp ./.local/share/mkcert/rootCA.pem ./

cd /tls-gen/basic
make
make alias-leaf-artifacts
cp -r ./result /root/mqtt
chmod 0700 /root/mqtt
chmod 0600 /root/mqtt/*
setfacl -R -m u:1883:rx /root/mqtt

echo Done!
