FROM alpine

RUN apk add --no-cache wget git openssl
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /bin/mkcert
RUN chmod +x /bin/mkcert

RUN cd /root && git clone --depth=1 https://github.com/rabbitmq/tls-gen

WORKDIR /root
