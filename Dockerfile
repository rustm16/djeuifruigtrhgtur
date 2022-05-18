FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -O Xray-linux-64.zip  https://github.com/XTLS/Xray-core/releases/download/v1.5.4/Xray-linux-64.zip  && \
    unzip Xray-linux-64.zip && \
    mv /xray /hsmj && \
    chmod +x /hsmj && \
    # cp /hsmj /hsmj && \
    # chmod +x /hsmj && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
