FROM alpine

RUN apk add --no-cache wget git openssl make python3 acl
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /bin/mkcert
RUN chmod +x /bin/mkcert

RUN git clone --depth=1 https://github.com/rabbitmq/tls-gen
COPY mkcerts.sh .

WORKDIR /root
