API_URL="https://api.github.com/repos/SinzMise/artalk-deploy/releases/latest"
DOWNLOAD_URL=$(curl -s $API_URL | jq -r ".assets[] | select(.name | contains(\"artalk-repl.moe\")) | .browser_download_url")
echo "Artalk一键搭建脚本"
echo "脚本作者：王九弦SZ·Ninty"
echo "GitHub开源地址：https://github.com/SinzMise/artalk-deploy/"
nix-env -iA nixpkgs.wget
mkdir build
cd build
wget -O .replit https://github.com/SinzMise/artalk-deploy/raw/replit/.replit
wget -O replit.nix https://github.com/SinzMise/artalk-deploy/raw/replit/replit.nix
cd ..
wget -O main.sh https://github.com/SinzMise/artalk-deploy/raw/replit/main.sh
wget -O artalk $DOWNLOAD_URL
cp -r build/.replit . && cp -r build/replit.nix .
echo "恭喜搭建完成"
echo "点击Run立即运行项目"
rm -rf build/ && rm -rf README.md
