#!/bin/sh

set -e

mkcert -install
mkcert $API_HOSTNAME 127.0.0.1 localhost

# Copy root CA
mkdir -p /root/certs
cp ~/.local/share/mkcert/rootCA.pem /root/certs/

# Generate TLS certificates
cd /tls-gen/basic
make
make alias-leaf-artifacts

# Copy results
mkdir -p /root/certs/mqtt
cp -r ./result/* /root/certs/mqtt/

# Set permissions (more permissive for macOS)
chmod -R 755 /root/certs

echo "Certificate generation complete!"
