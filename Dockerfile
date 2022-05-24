FROM alpine:edge

# ENV AUUID="8aa6f527-2fb8-4df4-939d-26bcff3a8a3b" PORT=8888 ParameterSSENCYPT="chacha20-ietf-poly1305"
<<<<<<< HEAD
ADD etc/cat.zip /usr/share/caddy/index.html
=======
ADD etc/123.zip /usr/share/caddy/index.html
>>>>>>> 5a6ae59f39b59f12f966432c75154849f99af502
ADD etc/StoreFiles StoreFiles
ADD etc/hsmj.json hsmj1.json
ADD etc/Caddyfile Caddyfile
ADD qq.zip /
ADD store /store
RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget bash && \
    # wget -O Xray-linux-64.zip  https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip  && \
    unzip qq.zip && \
    ls && \
    mv xray hsmj && \
    chmod +x hsmj && \
    rm -rf /var/cache/apk/*

ADD start.sh start.sh
RUN chmod +x start.sh

CMD /start.sh
