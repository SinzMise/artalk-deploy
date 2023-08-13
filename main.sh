#!/bin/bash
# 防休眠命令
while true; do curl -s --user-agent "${UA_Browser}" "https://${REPL_SLUG}.${REPL_OWNER}.repl.co" >/dev/null 2>&1 && echo "$(date +'%Y%m%d%H%M%S') Keeping online ..." && sleep 600; done &
# 更新Artalk
rm -rf artalk && wget -O artalk https://github.com/SinzMise/Artalk-on-replit/raw/main/artalk.moe

# 启动Artalk
echo "run artalk >>> $(date '+%Y-%m-%d %H:%M:%S')"

chmod +x ./artalk

# 数据库文件存放的地方
if [ ! -d ./db ];then
    mkdir ./db
fi

Artalk_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co

echo "click url: $Artalk_URL"

./artalk server
