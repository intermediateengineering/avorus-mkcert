FROM alpine

RUN apk add --no-cache wget git openssl make python3 acl bash

# Install mkcert
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /usr/local/bin/mkcert
RUN chmod +x /usr/local/bin/mkcert

# Clone TLS generation tools
RUN git clone --depth=1 https://github.com/rabbitmq/tls-gen /tls-gen

COPY mkcerts.sh /mkcerts.sh
RUN chmod +x /mkcerts.sh

WORKDIR /root
