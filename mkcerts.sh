#!/bin/sh

mkcert $API_HOSTNAME 127.0.0.1 localhost

cd tls-gen/basic
make
make alias-leaf-artifacts
