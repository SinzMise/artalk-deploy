#!/bin/sh

API_URL="https://api.github.com/repos/SinzMise/artalk-deploy/releases/latest"

DOWNLOAD_URL=$(curl -s $API_URL | jq -r ".assets[] | select(.name | contains(\"artalk-repl.moe\")) | .browser_download_url")

curl -L $DOWNLOAD_URL -o artalk

chmod +x artalk

echo "Artalk-FreeBSD最新版本已经下载覆盖完成！"