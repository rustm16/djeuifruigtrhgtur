#!/bin/bash

# configs
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt
unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/
sed -e "1c :$PORT" -e "s/\$AUUID/$AUUID/g" -e "s/\$MYUUID-HASH/$(caddy hash-password --plaintext $AUUID)/g" Caddyfile >/etc/caddy/Caddyfile
sed -e "s/\$AUUID/$AUUID/g" -e "s/\$ParameterSSENCYPT/$ParameterSSENCYPT/g" hsmj1.json > hsmj.json

# storefiles
mkdir -p /usr/share/caddy/$AUUID && mv StoreFiles /usr/share/caddy/$AUUID/StoreFiles
# wget -P /usr/share/caddy/$AUUID -i /usr/share/caddy/$AUUID/StoreFiles
mv /store/* /usr/share/caddy/$AUUID/

for file in $(ls /usr/share/caddy/$AUUID); do
    [[ "$file" != "StoreFiles" ]] && echo \<a href=\""$file"\" download\>$file\<\/a\>\<br\> >>/usr/share/caddy/$AUUID/ClickToDownloadStoreFiles.html
done

# start
tor &

./hsmj -config hsmj.json

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile